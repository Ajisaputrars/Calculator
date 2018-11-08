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
    private var lastOperation :LastOperation = .Clear
    var description = [AnyObject]()
    var isPartialResult: Bool {
        if pending != nil {
            return true
        }
        return false
    }
    
    func setOperand(operand: Double){
        accumulator = operand
        description.append(operand as AnyObject)
    }
    
    private enum Operation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) ->(Double))
        case Equals
        case Clear
    }
    
    private enum LastOperation {
        case Digit
        case Constant
        case UnaryOperation
        case BinaryOperation
        case Equals
        case Clear
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
        "c" : Operation.Clear,
        "=" : Operation.Equals
    ]
    
    func performOperation(symbol: String){
        if let operation = operation[symbol] {
            switch operation {
            case .Constant (let value) :
                accumulator = value
                description.append(symbol as AnyObject)
                lastOperation = .Constant
            case .UnaryOperation(let function) :
                accumulator = function(accumulator)
                let index = description.count - 1
                description.insert(symbol as AnyObject, at: index)
                lastOperation = .UnaryOperation
            case .BinaryOperation(let function) :
                executePendingBinaryOperation()
                pending = PendingBinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)
                description.append(symbol as AnyObject)
                lastOperation = .BinaryOperation
            case .Equals :
                executePendingBinaryOperation()
                description.append(symbol as AnyObject)
                lastOperation = .Equals
            case .Clear :
                break
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
    
    private func clear() {
        accumulator = 0
        pending = nil
        description.removeAll()
        lastOperation = .Clear
    }
}

extension Calculator {
    struct PendingBinaryOperationInfo {
        var binaryFunction: (Double, Double) -> Double
        var firstOperand: Double
    }
}

typealias PropertyList = AnyObject
