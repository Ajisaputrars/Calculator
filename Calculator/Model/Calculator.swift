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
    
    private enum Operation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) ->(Double))
        case Equals
    }
    
    private var operation: Dictionary<String, Operation> = [
        "𝜋" : Operation.Constant(3.14), // Double.pi,
        "e" : Operation.Constant(M_E), //M_E
        "√" : Operation.UnaryOperation(sqrt),
        "cos" : Operation.UnaryOperation(cos),//M_E
        "x" : Operation.BinaryOperation({$0 * $1}),
        "+" : Operation.BinaryOperation({$0 + $1}),
        "-" : Operation.BinaryOperation({$0 - $1}),
        "÷" : Operation.BinaryOperation({$0 / $1}),
        "=" : Operation.Equals
    ]
    
    func performOperation(symbol: String){
        if let operation = operation[symbol] {
            switch operation {
            case .Constant (let value) :
                accumulator = value
            case .UnaryOperation(let function) :
                accumulator = function(accumulator)
            case .BinaryOperation(let function) :
                executePendingBinaryOperation()
                pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)
            case .Equals :
                executePendingBinaryOperation()
            }
        }
    }
    
    private func executePendingBinaryOperation(){
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
            pending = nil
        }
    }
    
    private var pending: PendingBinaryOperationInfo?
    
    var result: Double {
        return accumulator
    }
}

extension Calculator {
    struct PendingBinaryOperationInfo {
        var binaryFunction: (Double, Double) -> Double
        var firstOperand: Double
    }
}
