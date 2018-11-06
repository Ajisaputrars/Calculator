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
    private var legalDigit = false
    private var zeroAllowed =  true

    private var displayValue: Double {
        get {
            return Double(mainView.displayLabel.text!)!
        } set {
            mainView.displayLabel.text = String(newValue)
        }
    }
    
    private var mainView: CalculatorView! {
        guard isViewLoaded else { return nil }
        return view as! CalculatorView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        brain = Calculator()
    }
    
    @IBAction private func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            if digit == "." {
                if legalDigit {
                    mainView.displayLabel.text = mainView.displayLabel.text! + digit
                    legalDigit = false
                    zeroAllowed = true
                }
            } else if digit == "0" {
                if zeroAllowed {
                    mainView.displayLabel.text = mainView.displayLabel.text! + digit
                }
            } else {
                mainView.displayLabel.text = mainView.displayLabel.text! + digit
                zeroAllowed = true
            }
        } else {
            if digit == "."{
                if legalDigit {
                    mainView.displayLabel.text = digit
                    legalDigit = false
                    userIsInTheMiddleOfTyping = true
                }
            } else if digit == "0" {
                if zeroAllowed {
                    mainView.displayLabel.text = digit
                    zeroAllowed = false
                    legalDigit = true
                    userIsInTheMiddleOfTyping = true
                }
            }
            else {
                mainView.displayLabel.text = digit
                legalDigit = true
                zeroAllowed = true
                userIsInTheMiddleOfTyping = true
            }
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
    }
}

extension CalculatorController{
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
