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
    
    var operation: Dictionary<String, Double> = [
        "𝜋" : Double.pi,
        "e" : M_E
    ]
    
    func performOperation(symbol: String){
        if let constant = operation[symbol] {
            accumulator = constant
        }
    }
    
    var result: Double {
        return accumulator
    }
}
