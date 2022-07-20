//
//  ViewController.swift
//  CalculatorStoryboard
//
//  Created by Kevin McKenney on 7/19/22.
//

import UIKit

class ViewController: UIViewController {
    
    var calculator = Calculator()

    @IBOutlet weak var display: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func onClickNumber(_ sender: UIButton) {
        calculator.enterNumber(digit: sender.tag)
        display.text = calculator.text
    }
    
    @IBAction func onClickOperation(_ sender: UIButton) {
        calculator.enterOperation(id: sender.tag)
    }
    
    @IBAction func onClickEqual(_ sender: Any) {
        calculator.resolve()
        display.text = calculator.text
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        calculator.delete()
        display.text = calculator.text
    }
    
    @IBAction func onClickClear(_ sender: Any) {
        calculator.clear()
        display.text = "0"
    }
    
    @IBAction func onClickAllClear(_ sender: Any) {
        calculator.clearAll()
        display.text = "0"
    }
    
    @IBAction func onClickSign(_ sender: Any) {
        calculator.negate()
        display.text = calculator.text
    }
    
    @IBAction func onClickDecimal(_ sender: Any) {
        calculator.enterPeriod()
    }
    
}

