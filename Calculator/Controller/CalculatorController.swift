//
//  ViewController.swift
//  Calculator2
//
//  Created by Aji Saputra Raka Siwi on 04/11/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class CalculatorController: UIViewController {
    
    private var userIsInTheMiddleOfTyping = false
    private var brain: Calculator!

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
            mainView.displayLabel.text = mainView.displayLabel.text! + digit
        } else {
            mainView.displayLabel.text = digit
        }
        userIsInTheMiddleOfTyping = true
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
