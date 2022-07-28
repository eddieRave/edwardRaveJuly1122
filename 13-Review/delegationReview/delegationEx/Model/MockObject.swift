//
//  MockObject.swift
//  delegationEx
//
//  Created by Rave Bizz on 7/22/22.
//

import Foundation

class DrinkGetterMock: DrinkGetable {
    var drinkType: Beverage
    init(drinkType: Beverage) {
        self.drinkType = drinkType
    }
    func getCoffee(orderType: Int) -> Beverage {
        return drinkType
    }
}
