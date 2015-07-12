//
//  Operation.swift
//  Calculator
//
//  Created by Craig Rhodes on 12/10/14.
//  Copyright (c) 2014 Craig Rhodes. All rights reserved.
//

import Foundation

/**
    The standard mathematical operators.

    - Exponentiation: The exponent operation.
    - Multiplication: The times operation.
    - Division: The divide operation.
    - Addition: The add operation.
    - Subtraction: The subtraction operation
*/
enum Operation: Character {
	case Exponentiation = "^"
	case Multiplication = "*"
	case Division = "/"
	case Addition = "+"
	case Subtraction = "-"
	
	
    /**
        Constructs an operation from the string
        that represents the operation.
    
        :param: string The string that represents the operation.
    */
	init?(string: String) {
		switch string {
		case "^":
			self = .Exponentiation
		case "*":
			self = .Multiplication
		case "/":
			self = .Division
		case "+":
			self = .Addition
		case "-":
			self = .Subtraction
		default:
			return nil
		}
	}
    
    /// All of the operations in priority order.
    static var all: [Operation] {
        return [Exponentiation, Multiplication, Division, Addition, Subtraction]
    }
}