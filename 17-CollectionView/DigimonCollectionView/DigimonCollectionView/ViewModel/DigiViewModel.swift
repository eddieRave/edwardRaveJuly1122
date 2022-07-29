//
//  DigiViewModel.swift
//  DigimonCollectionView
//
//  Created by Joel Maldonado on 7/29/22.
//

import Foundation

class DigiViewModel {
    var digimon = [Digimon]()
    var numDigimon: Int {
        digimon.count
    }
    
    func fetchDigimon(completion: @escaping () -> Void) {
        ApiManager.shared.fetchData {
            digimon in
            
            self.digimon = digimon
            
            completion()
        }
    }
    
    func getDigimon(at: Int) -> Digimon? {
        return digimon[at]
    }
}
