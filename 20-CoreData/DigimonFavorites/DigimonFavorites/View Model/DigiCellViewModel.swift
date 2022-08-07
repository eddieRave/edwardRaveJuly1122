//
//  DigiCellViewModel.swift
//  DigimonFavorites
//
//  Created by Joel Maldonado on 8/6/22.
//

import Foundation

class DigiCellViewModel {
    var digimon: DigimonModel
    var isFavorite = true
    
    var name: String {
        digimon.name
    }
    
    var level: String {
        digimon.level
    }
    
    var imgStr: String {
        digimon.img
    }
    
    var onChange: () -> Void = {}
    var removeFavorite: (Int) -> Void = {_ in}
    
    init(digimon: DigimonModel) {
        self.digimon = digimon
    }
    
    func toggleFavorite(index: Int) {
        isFavorite.toggle()
        if isFavorite {
            CoreDataService.shared.storeDigimonToFavorites(digimon: digimon)
        } else {
            CoreDataService.shared.deleteFavDigimon(name: name)
            removeFavorite(index)
        }
        onChange()
    }
}
