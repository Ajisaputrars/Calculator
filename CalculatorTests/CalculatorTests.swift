//
//  Calculator2Tests.swift
//  Calculator2Tests
//
//  Created by Aji Saputra Raka Siwi on 04/11/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    
    var brain:Calculator!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        brain = Calculator()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        brain = nil
        
        super.tearDown()
    }
    
    func testAddition() {
        brain.setOperand(operand: 7)
        brain.performOperation(symbol: "+")
        brain.setOperand(operand: 5)
        brain.performOperation(symbol: "=")
        
        XCTAssertEqual(brain.result, 12)
    }
    
    func testSubstraction() {
        brain.setOperand(operand: 7)
        brain.performOperation(symbol: "-")
        brain.setOperand(operand: 5)
        brain.performOperation(symbol: "=")
        
        XCTAssertEqual(brain.result, 2)
    }
    
    func testMultiplication() {
        brain.setOperand(operand: 7)
        brain.performOperation(symbol: "x")
        brain.setOperand(operand: 5)
        brain.performOperation(symbol: "=")
        
        XCTAssertEqual(brain.result, 35)
    }
    
    func testDivide() {
        brain.setOperand(operand: 10)
        brain.performOperation(symbol: "÷")
        brain.setOperand(operand: 2)
        brain.performOperation(symbol: "=")
        
        XCTAssertEqual(brain.result, 5)
    }
    
    func testCosine() {
        brain.setOperand(operand: 30)
        brain.performOperation(symbol: "cos")
        
        XCTAssertEqual(brain.result, cos(30))
    }
    
    func testPhi() {
        brain.performOperation(symbol: "𝜋")
        
        XCTAssertEqual(brain.result, 3.14)
    }
    
    func testSqrt() {
        brain.setOperand(operand: 25)
        brain.performOperation(symbol: "√")
        
        XCTAssertEqual(brain.result, 5)
    }
    
    func testAddAndSubstract(){
        brain.setOperand(operand: 10)
        brain.performOperation(symbol: "+")
        brain.setOperand(operand: 5)
        brain.performOperation(symbol: "-")
        brain.setOperand(operand: 3)
        brain.performOperation(symbol: "=")
        
        XCTAssertEqual(brain.result, 12)
    }
}
