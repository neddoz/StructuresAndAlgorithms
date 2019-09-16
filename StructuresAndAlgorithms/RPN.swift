//
//  RPN.swift
//  StructuresAndAlgorithms
//
//  Created by kayeli dennis on 16/09/2019.
//  Copyright © 2019 kayeli dennis. All rights reserved.
//

import Foundation

func evalRPN(_ tokens: [String]) -> Int {
    
    var stack = [Int]()
    
    guard !tokens.isEmpty else {return 0}
    
    let validTokens = ["*","+", "-", "/"]
    
    for character in tokens {
        
        if validTokens.contains(character) {
            
            if stack.count >= 2 {
                let value1 = stack[stack.count - 1]
                let value2 = stack[stack.count - 2]
                let stringToEvaluate = "\(value2) \(character) \(value1)"
                let expn = NSExpression(format: stringToEvaluate)
                if let result = expn.expressionValue(with: nil, context: nil) as? Int {
                    stack.removeLast()
                    stack.removeLast()
                    stack.append(result)
                }
            }
        } else {
            if let integerValue = Int(character) {
                stack.append(integerValue)
            }
        }
    }
    return stack.last ?? 0
}
