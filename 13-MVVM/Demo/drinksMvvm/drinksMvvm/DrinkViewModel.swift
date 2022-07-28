//
//  DrinkViewModel.swift
//  drinksMvvm
//
//  Created by Rave Bizz on 5/5/22.
//

import Foundation

/*
 Incoming Data:
 Server/Database -> Network Object -> ViewModel -> Model
 
 Outgoing Data:
 Model -> ViewModel -> View
 
 Controller shouldn't refer to the data directly
 */

class DrinkViewModel {
    
    var cellViewModels = [DrinkCellViewModel]()
    var numDrinks: Int {
        cellViewModels.count
    }
    
    func fetchData(completion: @escaping () -> Void) {
        Webservice.shared.getDrinks { drinks in
            for drink in drinks {
                self.cellViewModels.append(DrinkCellViewModel(drink: drink))
            }
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    func getCellVM(_ indexPath: IndexPath) -> DrinkCellViewModel {
        cellViewModels[indexPath.row]
    }
}
