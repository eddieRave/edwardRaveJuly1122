//
//  DrinkCellViewModel.swift
//  drinksMvvm
//
//  Created by Rave Bizz on 5/5/22.
//

import Foundation

class DrinkCellViewModel {
    
    var drink: DrinkModel.Drink
    var drinkName: String {
        drink.name
    }
    
    var imageData: Data? {
        didSet {
            DispatchQueue.main.async {
                self.updateImage()
            }
        }
    }
    
    var updateImage: () -> Void = { print("closure")}
    
    init(drink: DrinkModel.Drink) {
        self.drink = drink
    }
    
    func fetchImage() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
            Webservice.shared.getImageData(imageUrl: self.drink.imageStr) { data in
                self.imageData = data
            }
        }
    }
    
}
