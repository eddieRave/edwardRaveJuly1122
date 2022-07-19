//
//  ViewController.swift
//  CALCULATOR
//
//  Created by WillC on 7/19/22.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var zeroPressed: UIButton!
    @IBOutlet weak var decimalPressed: UIButton!
    @IBOutlet weak var dividePressed: UIButton!
    @IBOutlet weak var multiplyPressed: UIButton!
    @IBOutlet weak var plusPressed: UIButton!
    @IBOutlet weak var equalsPressed: UIButton!
    @IBOutlet weak var minusPressed: UIButton!
    @IBOutlet weak var resultDisplay: UILabel!
    
    var lInput : [Int] = []
    var rInput : [Int] = []
    
    var mode : String = "NULL"
    var decimalPlace : Float = 0.0
    var decimalOn : Bool = false

    
    func sumToNumber( numArr : [Int] ) -> Float {
        var resultNum : Float = 0.0
        for i in 0..<numArr.count{
            resultNum += Float(Double(numArr[i]) * pow(10.0,Double(i)))
        }
        return resultNum
    }
    
    func displayNumber(numArr : [Int] ) -> String {
        var resultStr  = ""
        for i in  numArr{
            resultStr.append(String(i))
        }
        return resultStr
    }
    
    func handleInput(number : Int) -> Void {
        if decimalOn {
            decimalPlace += 1
        }
        if mode == "NULL"{
            lInput.append(number)
            resultDisplay.text = displayNumber(numArr : lInput)
            return
        } else {
            rInput.append(number)
            resultDisplay.text = displayNumber(numArr : rInput)
            return
        }
    }
    
    @IBAction func decimalPressed(_ sender: Any) {
        if mode == "NULL"{
            decimalOn = true
            resultDisplay.text = displayNumber(numArr : lInput) +  "."
        }
        
    }
    @IBAction func plusPressed(_ sender: Any) {
        
        mode = "PLUS"
        resultDisplay.text = "+"
//        resultDisplay.text = String( sumToNumber(numArr : lInput.reversed()) / pow(10,   decimalPlace))
    }
    @IBAction func dividePressed(_ sender: Any) {
        mode = "DIVIDE"
        resultDisplay.text = "/"
    }
    @IBAction func multiplyPressed(_ sender: Any) {
        mode = "MULTIPLY"
        resultDisplay.text = "*"
    }
    @IBAction func minusPressed(_ sender: Any) {
        mode = "MINUS"
        resultDisplay.text = "-"
        
    }
    @IBAction func equalsPressed(_ sender: Any) {
        let lhs : Float  = sumToNumber(numArr : lInput.reversed())
        let rhs : Float = sumToNumber(numArr : rInput.reversed())
        var result : Float = 0.0
        if mode == "NULL"{
            result = lhs
        }
        if mode == "PLUS"{
            result = lhs + rhs
        }
        if mode == "MINUS"{
            result = lhs - rhs
        }
        if mode == "MULTIPLY"{
            result = lhs * rhs
        }
        if mode == "DIVIDE"{
            result = lhs / rhs
        }
        resultDisplay.text = String(result)
        lInput.removeAll()
        rInput.removeAll()
        mode = "NULL"
    }
    @IBAction func zeroPressed(_ sender: Any) {
        handleInput(number: 0)
    }
    
    @IBAction func One(_ sender: Any) {
        handleInput(number: 1)
    }
    @IBAction func Two(_ sender: Any) {
        
        handleInput(number: 2)
    }
    @IBAction func Three(_ sender: Any) {
        
        handleInput(number: 3)
    }
    @IBAction func Four(_ sender: Any) {
        
        handleInput(number: 4)
    }
    @IBAction func Five(_ sender: Any) {
        
        handleInput(number: 5)
    }
    @IBAction func Six(_ sender: Any) {
        
        handleInput(number: 6)
    }
    @IBAction func Seven(_ sender: Any) {
        
        handleInput(number: 7)
    }
    @IBAction func Eight(_ sender: Any) {
        
        handleInput(number: 8)
    }
    @IBAction func Nine(_ sender: Any) {
        handleInput(number: 9)
    }

}

