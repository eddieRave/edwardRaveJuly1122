//
//  ViewController.swift
//  calculator
//
//  Created by Joel Maldonado on 7/19/22.
//

import UIKit

class ViewController: UIViewController {
    
    let calc = Calculator()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var clearButton: UIButton!
    
    @IBAction func numberTapped(_ sender: UIButton) {
        if calc.getResult() != nil {
            calc.clearValues()
            display.text = String(sender.tag)
        } else {
            display.text = (display.text ?? "") + String(sender.tag)
        }
        clearButton.titleLabel?.text = "C"
    }
    
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        if let op = sender.titleLabel?.text?.first, let input = display.text {
            calc.onOperator(op: op, num: Int(input))
        }
        
        display.text = ""
    }
    
    @IBAction func equalTapped(_ sender: UIButton) {
        guard let input = display.text else { return }
        calc.calculate(input: Int(input))
        if let result = calc.getResult() {
            display.text = String(result)
            calc.clearValues()
        }
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        
        if display.text == "" {
            calc.clearValues()
        } else {
            display.text = ""
            clearButton.titleLabel?.text = "CA"
        }
    }
}

