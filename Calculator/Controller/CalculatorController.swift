//
//  ViewController.swift
//  Calculator2
//
//  Created by Aji Saputra Raka Siwi on 04/11/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class CalculatorController: UIViewController {
    private var brain: Calculator!
    
    private var userIsInTheMiddleOfTyping = false
    private var zeroAllowed =  true

    private var displayValue: Double {
        get {
            return Double(mainView.displayLabel.text!)!
        } set {
            mainView.displayLabel.text = String(newValue)
        }
    }
    
    private var mainView: CalculatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView = view as! CalculatorView
        
        brain = Calculator()
        
        mainView.displayLabel2.text = ""
        
        testingS()
    }
    
    @IBAction private func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTyping {
            if mainView.displayLabel.text == "0" {
                if digit != "0" {
                    if digit == "." {
                        mainView.displayLabel.text = mainView.displayLabel.text! + digit
                    } else {
                        mainView.displayLabel.text = ""
                    }
                }
            }
            
            if digit == "." {
                if mainView.displayLabel.text?.range(of: ".") == nil {
                    mainView.displayLabel.text = mainView.displayLabel.text! + digit
                }
                zeroAllowed = true
            } else if digit == "0" {
                if zeroAllowed {
                    mainView.displayLabel.text = mainView.displayLabel.text! + digit
                }
            } else {
                mainView.displayLabel.text = mainView.displayLabel.text! + digit
                zeroAllowed = true
            }

        } else {
            if digit == "." {
                mainView.displayLabel.text = "0."
            } else {
                mainView.displayLabel.text = digit
                if digit == "0" {
                    zeroAllowed = false
                }
            }
            userIsInTheMiddleOfTyping = true
        }
    }
    @IBAction private func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(operand: displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        if let mathSymbol = sender.currentTitle {
            brain.performOperation(symbol: mathSymbol)
        }
        displayValue = brain.result
        
        print("Ada partial result? = \(brain.isPartialResult)")
        
        mainView.displayLabel2.text = ""
        
        for i in brain.description {
            mainView.displayLabel2.text = mainView.displayLabel2.text! + "\(i)"
        }
        if brain.isPartialResult {
            mainView.displayLabel2.text = mainView.displayLabel2.text! + "..."
        }
    }
}

extension CalculatorController{
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func testingS(){
        let cube = 27.0
        let epsilon = 0.01
        var guess = 0.0
        let increment = 0.01
        var numGuesses = 0
        
        while abs((guess*guess*guess) - cube) >= epsilon && guess <= cube {
            let a = abs((guess*guess*guess) - cube)
            print(a)
            guess += increment
            numGuesses += 1
        }
        print("Numb Guesses = \(numGuesses)")
        
        if abs((guess*guess*guess) - cube) >= epsilon {
            print("Failed to find a cube root of \(cube)")
        } else {
            print("\(guess) is close enough the root cube of \(cube)")
        }
    }
}
