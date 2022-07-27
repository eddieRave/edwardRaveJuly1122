//
//  DrinkViewModel.swift
//  DrinksTable
//
//  Created by Joel Maldonado on 7/27/22.
//

import Foundation

class DrinkViewModel {
    
    var onChange: () -> Void = {}
    
    var drinks = [Drink]() {
        didSet {
            onChange()
        }
    }
    
    var numDrinks: Int {
        drinks.count
    }
    
    func getDrinks() {
        Network.shared.getDrinks {
            data in
            self.drinks = data
        }
    }
    
    func getName(for index: Int) -> String? {
        return drinks[index].name
    }
    
    func getImg(for index: Int) -> String? {
        return drinks[index].imageStr
    }
}
