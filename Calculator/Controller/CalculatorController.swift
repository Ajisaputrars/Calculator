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
        
        print("Jumlah array adalah = \(brain.description.count)")
        for i in brain.description {
            print(i)
        }
        print("")
    }
}

extension CalculatorController{
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
