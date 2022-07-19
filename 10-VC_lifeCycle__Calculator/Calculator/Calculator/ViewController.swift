//
//  ViewController.swift
//  Calculator
//
//  Created by Spencer Hurd on 7/19/22.
//

// TODO: add active button highlighting
// TODO: support float/decimal numbers
// TODO: add a decimal button
// TODO: add negative/positive button

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var output: UILabel!
    @IBOutlet weak var divideUI: UIButton!
    @IBOutlet weak var multiplyUI: UIButton!
    @IBOutlet weak var minusUI: UIButton!
    @IBOutlet weak var plusUI: UIButton!
    
    var lhs: String = ""
    var rhs: String = ""
    var selectedOperator: String = ""
    var moveToSecondOperand: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after
    }
    
    @IBAction func plus(_ sender: UIButton) {
        selectedOperator = "+"
        moveToSecondOperand = true
    }
    
    @IBAction func minus(_ sender: UIButton) {
        selectedOperator = "-"
        moveToSecondOperand = true
    }
    
    @IBAction func multiply(_ sender: UIButton) {
        selectedOperator = "*"
        moveToSecondOperand = true
//        sender.backgroundColor = .black
    }
    
    @IBAction func divide(_ sender: UIButton) {
        selectedOperator = "/"
        moveToSecondOperand = true
    }
    
    @IBAction func zero(_ sender: UIButton) {
        updateLhsRhs(input: "0")
    }
    
    @IBAction func one(_ sender: UIButton) {
        updateLhsRhs(input: "1")
    }
    
    @IBAction func two(_ sender: UIButton) {
        updateLhsRhs(input: "2")
    }
    
    @IBAction func three(_ sender: UIButton) {
        updateLhsRhs(input: "3")
    }
    
    @IBAction func four(_ sender: UIButton) {
        updateLhsRhs(input: "4")
    }
    
    @IBAction func five(_ sender: UIButton) {
        updateLhsRhs(input: "5")
    }
    
    @IBAction func six(_ sender: UIButton) {
        updateLhsRhs(input: "6")
    }
    
    @IBAction func seven(_ sender: UIButton) {
        updateLhsRhs(input: "7")
    }
    
    @IBAction func eight(_ sender: UIButton) {
        updateLhsRhs(input: "8")
    }
    
    @IBAction func nine(_ sender: UIButton) {
        updateLhsRhs(input: "9")
    }
    
    func updateLhsRhs(input: String) {
        if moveToSecondOperand == false {
            lhs.append(input)
            output.text = lhs
        } else if moveToSecondOperand == true {
            rhs.append(input)
            output.text = rhs
        } else {
            print("Error updating numbers")
        }
    }
    
    @IBAction func equals(_ sender: UIButton) {
        output.text = calculate()
    }
    
    @IBAction func clearAll(_ sender: UIButton) {
        output.text = "Begin calculating"
        lhs = ""
        rhs = ""
        selectedOperator = ""
        moveToSecondOperand = false
    }
    
    func calculate() -> String {
        var total = 0
        let left = Int(lhs) ?? 0
        let right = Int(rhs) ?? 0
        switch selectedOperator {
        case "+":
            total = left + right
        case "-":
            total = left - right
        case "*":
            total = left * right
        case "/":
            total = left / right
        default:
            print("Operator not found")
        }
        lhs = String(total)
        rhs = ""
        selectedOperator = ""
        moveToSecondOperand = false
        return String(total)
    }
    
}


