//
//  Assistant.swift
//  delegationEx
//
//  Created by Rave Bizz on 7/22/22.
//

import Foundation

class Assistant: DrinkGetable {
    func getCoffee(orderType: Int) -> Beverage {
        let oz = Int.random(in: 0...16)
        switch orderType {
        case 0:
            return .lightRoast(oz)
        case 1:
            return .darkRoast(oz)
        default:
            return .tea(oz)
        }
    }
    func buyGroceries() {}
    func cleanHouse() {}
}
