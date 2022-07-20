//
//  ViewController.swift
//  Calculator
//
//  Created by Maher Damouni on 7/19/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var total: Int = 0 {
        didSet{
            totalLabel.text = "\(total)"

        }
    }
    
    var operation = "none"
    var equalWasPressed = false
    var firstValue = 0
    var previousTotals = [Int]()

    @IBOutlet weak var totalLabel: UILabel!
    
    
    @IBAction func numberButton(_ sender: UIButton) {
        
        if total == 0 || equalWasPressed {
            total = sender.tag
            equalWasPressed = false
        } else {
            
        total = Int("\(total)\(sender.tag)")!
        }
    }
    
    @IBAction func operationButton(_ sender: UIButton) {

        if sender.tag == 0 {
            firstValue = total
            total = 0
            operation = "plus"
        } else if sender.tag == 1 {
            firstValue = total
            total = 0
            operation = "minus"
        } else if sender.tag == 2 {
            firstValue = total
            total = 0
            operation = "multiply"
        } else {
            firstValue = total
            total = 0
            operation = "divide"
        }
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        
        total = 0
        operation = "none"
        firstValue = 0
    }
    
    @IBAction func equalButton(_ sender: UIButton) {
        
        if operation == "plus" {
            total = firstValue + total
            firstValue = 0
        } else if operation == "minus" {
            total = firstValue - total
            firstValue = 0
        } else if operation == "multiply" {
            total = firstValue * total
            firstValue = 0
        } else if operation == "divide" {
            total = firstValue / total
            firstValue = 0
        }
        
        previousTotals.append(total)
        equalWasPressed = true
    }
    
    @IBAction func getPreviousTotal(_ sender: UIButton) {
        
        if previousTotals.count == 1 {
            
            total = previousTotals[0]
        }
        
        if previousTotals.count >= 2 {
            if previousTotals[previousTotals.count - 1] == total {
                total = previousTotals[previousTotals.count - 2]
            } else {
                total = previousTotals[previousTotals.count - 1]
            }
        }
    }
    
    @IBAction func backspaceButton(_ sender: UIButton) {
        
        var string = String(total)
        string.remove(at: string.index(before: string.endIndex))
        if let newTotal = Int(string) {
            total = newTotal
        } else {
            total = 0
        }
    }
}


