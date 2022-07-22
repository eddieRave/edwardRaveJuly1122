//
//  Controller.swift
//  Calculator
//
//  Created by Kevin McKenney on 7/21/22.
//

import SwiftUI

class Controller: ObservableObject {
    @Published private var calculator = Calculator()
    
    var buttonLabels = [
        ["<-","+/-","C","AC"],
        ["1","2","3","+"],
        ["4","5","6","-"],
        ["7","8","9","*"],
        ["0",".","=","/"],
        ["^","","",""]
    ]
    
    var displayText = "0"
    
    func buttonPressed(tag: Int) {
        switch tag {
        case 0:
            calculator.delete()
            displayText = calculator.text
        case 1:
            calculator.negate()
            displayText = calculator.text
        case 2:
            calculator.clear()
            displayText = "0"
        case 3:
            calculator.clearAll()
            displayText = "0"
        case 4...6, 8...10, 12...14, 16:
            calculator.enterNumber(digit: toDigit(tag))
            displayText = calculator.text
        case 7, 11, 15, 19:
            calculator.enterOperation(id: toOperation(tag))
        case 17:
            calculator.enterPeriod()
            displayText = calculator.text
        case 18:
            calculator.resolve()
            displayText = calculator.text
        default:
            break
        }
    }
    
    
    func toDigit(_ n: Int) -> Int {
        n == 16 ? 0 : n - 2 - (n / 4)
    }
    
    func toOperation(_ n: Int) -> Int {
        (n - 3) / 4
    }
}
