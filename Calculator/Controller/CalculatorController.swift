//
//  ViewController.swift
//  Calculator2
//
//  Created by Aji Saputra Raka Siwi on 04/11/18.
//  Copyright © 2018 Aji Saputra Raka Siwi. All rights reserved.
//

import UIKit

class CalculatorController: UIViewController {
    
    private var mainView: CalculatorView! {
        guard isViewLoaded else { return nil }
        return view as! CalculatorView
    }
    
    var userIsInTheMiddleOfTyping = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            mainView.displayLabel.text = mainView.displayLabel.text! + digit
        } else {
            mainView.displayLabel.text = digit
        }
        userIsInTheMiddleOfTyping = true
    }
    @IBAction func performOperation(_ sender: UIButton) {
        if let sender = sender.currentTitle {
            if sender == "𝜋" {
                mainView.displayLabel.text = "\(Double.pi)"
            }
        }
        userIsInTheMiddleOfTyping = false
    }
}

extension CalculatorController{
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
