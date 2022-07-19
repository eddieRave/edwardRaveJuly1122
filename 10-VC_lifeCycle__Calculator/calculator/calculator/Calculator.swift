//
//  Calculator.swift
//  calculator
//
//  Created by Joel Maldonado on 7/19/22.
//

import Foundation

class Calculator {
    var firstNum: Int? = nil
    var secondNum: Int? = nil
    var op: Character? = nil
    var result: Int? = nil
    
    static let operationByOperator: [Character:(Int, Int) -> Int] = [
        "÷": {
                num1, num2 in
            return num1 / num2
        },
        "x": {
            num1, num2 in
            return num1 * num2
        },
        "-": {
            num1, num2 in
            return num1 - num2
        },
        "+": {
            num1, num2 in
            return num1 + num2
        }
    ]
    
    func onOperator(op: Character, num: Int?) {
        guard let num = num else { return }
        
        print("on operator passing guard")
        
        if firstNum != nil {
            secondNum = num
            calculate(input: nil)
            if let res = result {
                clearValues()
                firstNum = res
            }
        } else {
            firstNum = num
        }
        
        self.op = op
    }
    
    func calculate(input: Int?) {
        guard let oper = self.op else { return }
        
        if let input = input {
            if(firstNum != nil ) {
                secondNum = input
            }
        }
            
        if let operation = Calculator.operationByOperator[oper] {
            guard let first = firstNum, let second = secondNum else { return }
            result = operation(first, second)
        }
    }
    
    func getResult() -> Int? {
        return result
    }
    
    func clearValues() {
        firstNum = nil
        secondNum = nil
        op = nil
        result = nil;
    }
}
