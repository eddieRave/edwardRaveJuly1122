//
//  DigimonViewModel.swift
//  Digimon
//
//  Created by Rave Bizz 63 on 8/7/22.
//

import Foundation

class DigimonViewModel {
    var digimon = [Digimon]()
    var numOfDigimon: Int {
        digimon.count
    }
    
    func getDigimon(digimonCompletion: @escaping () -> Void) {
        Networking.shared.fetchData(dataCompletion: {digimon in
            self.digimon = digimon
        })
    }
    
    func getName(for index: Int) -> String? {
        digimon[index].name
    }
    
    func getLevel(for index: Int) -> String? {
        digimon[index].level
    }
    
    func getImage(for index: Int) -> String? {
        digimon[index].img
    }
}
