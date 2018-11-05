//
//  Calculator.swift
//  Calculator
//
//  Created by Aji Saputra Raka Siwi on 04/11/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import Foundation

class Calculator{
    
    private var accumulator = 0.0
    
    func setOperand(operand: Double){
        accumulator = operand
    }
    
    enum Operation {
        case Constant(Double)
        case UnaryOperation
        case BinaryOperation
        case Equal
    }
    
    private var operation: Dictionary<String, Operation> = [
        "𝜋" : Operation.Constant(.pi), // Double.pi,
        "e" : Operation.Constant(M_E), //M_E
        "√" : Operation.UnaryOperation,
        "cos" : Operation.UnaryOperation//M_E
    ]
    
    func performOperation(symbol: String){
        if let operation = operation[symbol] {
            switch operation {
            case .Constant (let value) :
                accumulator = value
            case .UnaryOperation :
                break
            case .BinaryOperation :
                break
            case .Equal :
                break
            }
        }
    }
    
    var result: Double {
        return accumulator
    }
}
