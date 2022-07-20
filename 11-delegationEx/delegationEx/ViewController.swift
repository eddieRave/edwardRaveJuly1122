//
//  ViewController.swift
//  delegationEx
//
//  Created by Rave Bizz on 7/20/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let coder = Coder()
        let assistant = Assistant()
        coder.coffeeDelegate = assistant
        coder.work()
    }
}

/* Advantages of Delegation
 1) Uncouples the Coder from the Assistant
 - Coder class should compile without Assistant Class
 2) Only give access to the func that the client class needs
 - Coder only has access to getCoffee() func and not other funcs on assistant
 3) Communication:
 - can pass info as parameters from Coder into Assistant class
 */

protocol CoffeeDelegate {
    func getCoffee(orderType: Int) -> Beverage
}

class Coder {
    var coffeeDelegate: CoffeeDelegate?
    var hasEnergy = false
    func work() {
        let beverage = coffeeDelegate?.getCoffee(orderType: 1)
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

class Assistant: CoffeeDelegate {
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

enum Beverage {
    case lightRoast(Int)
    case darkRoast(Int)
    case tea(Int)
}
