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
    
    func performOperation(symbol: String){
        switch symbol {
        case "𝜋":
            accumulator = Double.pi
        case "√":
            accumulator = sqrt(accumulator)
        case "e":
            accumulator = M_E
        default:
            print("Break nih")
            break
        }
    }
    
    var result: Double {
        return accumulator
    }
}
