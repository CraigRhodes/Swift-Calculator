//
//  Calculator.swift
//  Calculator
//
//  Created by Craig Rhodes on 12/10/14.
//  Copyright (c) 2014 Craig Rhodes. All rights reserved.
//

import Foundation

final class Calculator {
	
	class func evaluate(#expression: String) -> String {
		var theExpression = expression
		var lastParenRange: Range<String.Index>
		var lastParenExpression: String
		while (theExpression.hasParentheses) {
			lastParenRange = theExpression.lastParenRange!
			lastParenExpression = theExpression.lastParenExpression
			theExpression.replaceRange(lastParenRange, with: evaluate(expression: lastParenExpression))
		}
		
		for operation in Operation.all {  theExpression = performOperation(operation, onExpression: theExpression)  }
		
		return theExpression
	}
	
    private class func performOperation(operation: Operation, onExpression expression: String) -> String {
		var theExpression = expression
		var left: String, right: String
		while (expression.contains(operation.rawValue)) {
			// Get
			switch operation {
			case .Exponentiation:
				theExpression.replaceRange(theExpression.firstExpressionRangeForOperation(operation), with: "\(left**right)")
			case .Multiplication:
				theExpression.replaceRange(theExpression.firstExpressionRangeForOperation(operation), with: "\(left * right)")
			case .Division:
				theExpression.replaceRange(theExpression.firstExpressionRangeForOperation(operation), with: "\(left / right)")
			case .Addition:
				theExpression.replaceRange(theExpression.firstExpressionRangeForOperation(operation), with: "\(left + right)")
			case .Subtraction:
				theExpression.replaceRange(theExpression.firstExpressionRangeForOperation(operation), with: "\(left - right)")
			}
		}
		return theExpression
	}
}

infix operator ** { }
func ** (left: String, right: String) -> Double {  return pow((left as NSString).doubleValue, (right as NSString).doubleValue)  }
func * (left: String, right: String) -> Double {  return (left as NSString).doubleValue * (right as NSString).doubleValue  }
func / (left: String, right: String) -> Double {  return (left as NSString).doubleValue / (right as NSString).doubleValue  }
func + (left: String, right: String) -> Double {  return (left as NSString).doubleValue + (right as NSString).doubleValue  }
func - (left: String, right: String) -> Double {  return (left as NSString).doubleValue - (right as NSString).doubleValue  }