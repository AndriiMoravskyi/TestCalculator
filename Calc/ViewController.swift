//
//  ViewController.swift
//  Calc
//
//  Created by Andriy_Moravskyi on 6/22/17.
//  Copyright © 2017 Andriy_Moravskyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    var userIsTyping = false
    
    @IBAction func touch(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsTyping {
        let textCurrentInDisplay = display.text!
        display.text = textCurrentInDisplay + digit
        } else {
            display.text = digit
            userIsTyping = true
        }
     }
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    private var Calculator = Brain();
      @IBAction func performOperation(_ sender: UIButton) {
        if userIsTyping {
            Calculator.setOperand(displayValue)
            userIsTyping = false
        }
        if let mathematicalSymbol  = sender.currentTitle{
            Calculator.performOperation(mathematicalSymbol)
        }
        if let result = Calculator.result{
            displayValue = result
        }
    }
}

