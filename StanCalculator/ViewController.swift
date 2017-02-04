//
//  ViewController.swift
//  StanCalculator
//
//  Created by Administrator on 29/01/2017.
//  Copyright © 2017 DoubleThunder. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var display: UILabel!
    
    private var userIsInTheMiddeleOfTyping = false
    
    @IBAction private func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddeleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
        }
        userIsInTheMiddeleOfTyping = true
    }
    
    private var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }

    private var brain = CalculatorBrain()
    
    @IBAction private func performOperation(_ sender: UIButton) {
        if userIsInTheMiddeleOfTyping {
            brain.setOperand(operand: displayValue)
            userIsInTheMiddeleOfTyping = false
        }
        
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(symbol: mathematicalSymbol)
        }
        displayValue = brain.result
    }

}
