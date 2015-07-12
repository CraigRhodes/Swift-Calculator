//
//  Expression.swift
//  Calculator
//
//  Created by Craig Rhodes on 12/10/14.
//  Copyright (c) 2014 Craig Rhodes. All rights reserved.
//

import Foundation

public typealias Expression = String

/// An extension of String to allow for convenient conversion from Range<Int> to Range<String.Index>
extension String {
    /// The result of evaluating the expression.
	public var evaluatedExpression: Expression { return Calculator.evaluate(expression: self) }
    /// Gets the expression contained within the innermost parentheses.
	public var lastParenExpression: Expression {
		if (!hasParentheses) {  return ""  }
		let expressionStart = advance(indexOfLastLeftParen!, 1)
		let expressionEnd = advance(indexOfFirstRightParenFromLastLeft!, -1)
		return substringWithRange(expressionStart...expressionEnd)
	}
	public var lastParenRange: Range<String.Index>? {
		if let left = indexOfLastLeftParen {
			if let right = indexOfFirstRightParenFromLastLeft {
				return left...right as Range<String.Index>?
			}
		}
		return nil
	}
	public var hasParentheses: Bool {
		var hasLeft = false
		
		for letter in self {
			if (letter == "(") {  hasLeft = true  }
			else if (hasLeft && letter == ")") {  return true  }
		}
		
		return false
	}
	var indexOfLastLeftParen: String.Index? {
		var currentIndex = self.endIndex
		for _ in 0..<count(self) {
			currentIndex = advance(currentIndex, -1)
			if (self[currentIndex] == "(") { return currentIndex }
		}
		
		return nil
	}
	var indexOfFirstRightParenFromLastLeft: String.Index? {
		if let leftParenIndex = indexOfLastLeftParen {
			var substring = substringFromIndex(leftParenIndex)
			var rightParenIndex = leftParenIndex
			for _ in 0..<count(substring) {
				rightParenIndex = advance(rightParenIndex, 1)
				if (self[rightParenIndex] == ")") { return rightParenIndex }
			}
		}
		return nil
	}
	
	
	func firstExpressionRangeForOperation(operation: Operation) -> String {
		// Find first occurrence of operator
		let opIndex = self.rangeOfString(operation, options: NSStringCompareOptions.LiteralSearch)
		
		// Find first position of number to left
		for i in 0..<opIndex {
			
		}
		// Find last position of number to the right
		// Return the range from the beginning of the left number
		//	to the end of the right
	}
	
	func contains(character: Character) -> Bool {
		for letter in self {
			if (letter == character) { return true }
		}
		return false
	}
}

// Allows comparison of Strings with Character by comparing the first Character
func == (left: Character, right: String) -> Bool {
	return left == right[right.startIndex]
}

func == (left: String, right: Character) -> Bool {
	return left[left.startIndex] == right
}