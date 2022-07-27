//
//  Girlfriend.swift
//  delegationEx
//
//  Created by Rave Bizz on 7/22/22.
//

import Foundation

class Girlfriend: DrinkGetable {
    func getCoffee(orderType: Int) -> Beverage {
        return Beverage.tea(16)
    }
}
