//
//  DigiViewModel.swift
//  DigimonCollectionView
//
//  Created by Joel Maldonado on 7/29/22.
//

import Foundation

class DigiViewModel {
    var digiCellViewModels = [DigiCellViewModel]() {
        didSet {
            onChange()
        }
    }
    
    var numDigimon: Int {
        digiCellViewModels.count
    }
    
    var onChange: () -> Void = {}
    
    func getDigimon() {
        ApiManager.shared.fetchData {
            digimon in
            
            for digi in digimon {
                let tempCellVM = DigiCellViewModel(digimon: digi)
                tempCellVM.onChange = self.onChange
                self.digiCellViewModels.append(tempCellVM)
            }
            
            self.checkFavorites()
        }
    }
    
    func checkFavorites() {
        guard let favDigimon = CoreDataService.shared.fetchFavDigimon() else {
            return
        }
        
        for digiCell in digiCellViewModels {
            if favDigimon.contains(where: {$0.name == digiCell.name}) {
                digiCell.isFavorite = true
            } else {
                digiCell.isFavorite = false
            }
        }
        
        onChange()
    }
    
    func getDigiCellVM(at index: Int) -> DigiCellViewModel {
        return digiCellViewModels[index]
    }
}
