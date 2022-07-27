//
//  Coder.swift
//  delegationEx
//
//  Created by Rave Bizz on 7/22/22.
//

import Foundation

class Coder {
    var assistant: DrinkGetable?
    var hasEnergy = false
    func work() {
        let beverage = assistant?.getCoffee(orderType: 1)
        switch beverage {
        case let .lightRoast(oz):
            hasEnergy = oz > 6
        case let .darkRoast(oz):
            hasEnergy = oz > 8
        case let .tea(oz):
            hasEnergy = oz >= 10
        case .none:
            hasEnergy = false
        }
        startCoding()
    }
    
    func startCoding() {
        hasEnergy ? print("intense coding") : print("not so intense")
    }
}
