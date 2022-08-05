//
//  Helper.swift
//  review2
//
//  Created by Rave Bizz on 8/5/22.
//

import Foundation

struct Helper {
    func uppercaseData(input: String, processCompletion: @escaping (String) -> Void) {
        print("start of Helper.upperCase()")
        let inputProcess = input.uppercased()
        greeting(calcCompletion: { resultStr in
            processCompletion(resultStr + inputProcess)
        })
    }
    
    func greeting(calcCompletion: @escaping (String) -> Void) {
        print("start of Helper.greeting()")
        var greeting = "hello"
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            greeting += "Luke"
            calcCompletion(greeting)
        }
    }
    
    
    
    
    func calculateWithReturn() -> String {
        var greeting = "hello"
        DispatchQueue.global().async {
            greeting += "Luke"
        }
        return greeting
    }
}
