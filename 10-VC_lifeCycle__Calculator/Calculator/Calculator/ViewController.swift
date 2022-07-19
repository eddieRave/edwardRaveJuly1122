//
//  ViewController.swift
//  Calculator
//
//  Created by Rave Bizz 63 on 7/19/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var calcWorkings: UILabel!
    @IBOutlet weak var calcResult: UILabel!
    var workings: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clear()
    }
    
    func clear() {
        workings = ""
        calcWorkings.text = ""
        calcResult.text = "0"
    }

    @IBAction func clearTap(_ sender: Any) {
        clear()
    }
    
    @IBAction func deleteTap(_ sender: Any) {
        if (!workings.isEmpty){
            workings.removeLast()
            calcWorkings.text = workings
        }
    }
    
    func addToWorkings(value: String) {
        workings = workings + value
        calcWorkings.text = workings
    }
    
    @IBAction func equalsTap(_ sender: Any) {
        let expression = NSExpression(format: workings)
        let result = expression.expressionValue(with: nil, context: nil) as! Double
        let resultString = formatResult(result: result)
        calcResult.text = resultString
    }
    
    func formatResult(result: Double) -> String {
        if (result.truncatingRemainder(dividingBy: 1) == 0) {
            return String(format: "%.0f", result)
        } else {
            return String(format: "%.2f", result)
        }
    }
    
    @IBAction func additionTap(_ sender: Any) {
        addToWorkings(value: "+")
    }
    
    @IBAction func subtractionTap(_ sender: Any) {
        addToWorkings(value: "-")
    }
    
    @IBAction func multiplicationTap(_ sender: Any) {
        addToWorkings(value: "*")
    }
    
    @IBAction func remainderTap(_ sender: Any) {
        addToWorkings(value: "%")
    }
    
    @IBAction func divisionTap(_ sender: Any) {
        addToWorkings(value: "/")
    }
    
    
    @IBAction func zeroTap(_ sender: Any) {
        addToWorkings(value: "0")
    }
    
    @IBAction func oneTap(_ sender: Any) {
        addToWorkings(value: "1")
    }
    
    @IBAction func twoTap(_ sender: Any) {
        addToWorkings(value: "2")
    }
    
    @IBAction func threeTap(_ sender: Any) {
        addToWorkings(value: "3")
    }
    
    @IBAction func fourTap(_ sender: Any) {
        addToWorkings(value: "4")
    }
    
    @IBAction func fiveTap(_ sender: Any) {
        addToWorkings(value: "5")
    }
    
    @IBAction func sixTap(_ sender: Any) {
        addToWorkings(value: "6")
    }
    
    @IBAction func sevenTap(_ sender: Any) {
        addToWorkings(value: "7")
    }
    
    @IBAction func eightTap(_ sender: Any) {
        addToWorkings(value: "8")
    }
    
    @IBAction func nineTAP(_ sender: Any) {
        addToWorkings(value: "9")
    }
}
