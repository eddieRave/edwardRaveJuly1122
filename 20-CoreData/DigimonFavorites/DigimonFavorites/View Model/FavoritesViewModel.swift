//
//  FavoritesViewModel.swift
//  DigimonFavorites
//
//  Created by Joel Maldonado on 8/6/22.
//

import Foundation

class FavoritesViewModel: DigiViewModel {
    override func getDigimon() {
        digiCellViewModels = []
        
        guard let data = CoreDataService.shared.fetchFavDigimon() else {
            return
        }
        
        for savedDigimon in data {
            let tempDigimon = DigimonModel(name: savedDigimon.value(forKey: "name") as! String, img: savedDigimon.value(forKey: "imgStr") as! String, level: savedDigimon.value(forKey: "level") as! String)
            
            let tempCellVM = DigiCellViewModel(digimon: tempDigimon)
            digiCellViewModels.append(DigiCellViewModel(digimon: tempDigimon))
        }
    }
    
    func removeCellVM(at index: Int) {
        digiCellViewModels.remove(at: index)
    }
}
