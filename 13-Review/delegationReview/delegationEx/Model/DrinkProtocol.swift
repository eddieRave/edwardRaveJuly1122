//
//  DrinkProtocol.swift
//  delegationEx
//
//  Created by Rave Bizz on 7/22/22.
//

import Foundation

protocol DrinkGetable {
    func getCoffee(orderType: Int) -> Beverage
}
