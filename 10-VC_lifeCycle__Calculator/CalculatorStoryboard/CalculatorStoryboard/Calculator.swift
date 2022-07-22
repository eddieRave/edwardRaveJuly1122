//
//  Calculator.swift
//  CalculatorStoryboard
//
//  Created by Kevin McKenney on 7/19/22.
//

import Foundation

struct Calculator {

    var ints = [0,0]
    var decimals = [0,0]
    var extraZeroes = [0,0]

    var result = 0.0
    
    var operationID = 0
    
    var useResult = false
    var showResult = false
    
    var firstEntry = true
    var decimalEntry = false
    
    var index: Int {
        firstEntry ? 0 : 1
    }
    
    var text = "0"
    
    mutating func enterNumber(digit: Int) {
        
        if !decimalEntry {
            ints[index] *= 10
            ints[index] += digit
        } else {
            decimals[index] *= 10
            decimals[index] += digit
            if decimals[index] == 0 {
                extraZeroes[index] += 1
            }
        }
        showResult = false
        setText()
    }
    
    mutating func setText() {
        
        if showResult {
            text = (String(result))
        } else {
            var zeroString = ""
            
            if extraZeroes[index] > 0 {
                for _ in 0..<extraZeroes[index] {
                    zeroString.append("0")
                }
            }
            
            if decimals[index] == 0 {
                if !zeroString.isEmpty {
                    zeroString.removeLast()
                }
            }
            
            let point = decimalEntry ? "." : ""
            let decimalString = extraZeroes[index] == 0 && decimals[index] == 0 ? "" : zeroString + String(decimals[index])
            text = String(ints[index]) + point + decimalString
        }
    }
    
    mutating func enterOperation(id: Int) {
        if firstEntry {
            firstEntry = false
            decimalEntry = false
            operationID = id
            useResult = ints[0] == 0 && decimals[0] == 0 && result != 0
        } else {
            resolve()
            firstEntry = false
            useResult = true
        }
    }
    
    mutating func resolve() {
        if !firstEntry {
            
            var nums = [0.0,0.0]
            
            nums.indices.forEach {
                nums[$0] = makeDouble(int: ints[$0], decimal: decimals[$0], extraZeroes: extraZeroes[$0])
            }
            
            if useResult {
                nums[0] = result
            }
            
            switch operationID {
            case 1:
                result = nums[0] + nums[1]
            case 2:
                result = nums[0] - nums[1]
            case 3:
                result = nums[0] * nums[1]
            case 4:
                result = nums[0] / nums[1]
            case 5:
                result = pow(nums[0], nums[1])
            default:
                break
            }
            
            showResult = true
            useResult = false
            setText()
            clearAll()
        }
    }
    
    mutating func clear() {
        ints[index] = 0
        decimals[index] = 0
        extraZeroes[index] = 0
        decimalEntry = false
        if firstEntry { result = 0 }
    }
    mutating func clearAll() {
        firstEntry = true
        decimalEntry = false
        
        (0...1).forEach {
            ints[$0] = 0
            decimals[$0] = 0
            extraZeroes[$0] = 0
        }
    }
    
    func makeDouble(int: Int, decimal: Int, extraZeroes: Int) -> Double {
        var places = 0
        var temp = decimal
        var divider = 1
        
        
        while temp > 0 {
            temp /= 10
            places += 1
        }
        
        places += extraZeroes
        
        for _ in 0..<places {
            divider *= 10
        }
        
        return Double(int) + Double(decimal) / (Double(divider))
    }
    
    mutating func delete() {
        if decimalEntry {
            if decimals[index] != 0 {
                decimals[index] /= 10
            } else {
                if extraZeroes[index] != 0 {
                    extraZeroes[index] -= 1
                } else {
                    decimalEntry = false
                }
            }
        } else {
            ints[index] /= 10
        }
        setText()
    }
    
    mutating func negate() {
        if !useResult {
            result *= -1
        }
        ints[index] *= -1
        setText()
    }
    
    mutating func enterPeriod() {
        if !decimalEntry {
            decimalEntry = true
        }
    }
}
