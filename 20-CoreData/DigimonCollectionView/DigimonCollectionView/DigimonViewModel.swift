//
//  DigimonViewModel.swift
//  DigimonCollectionView
//
//  Created by Spencer Hurd on 7/30/22.
//

/**
 ASSIGNMENT:
     Create a collection view in mvvm format using data from this api
        https://digimon-api.vercel.app/api/digimon
 */

import Foundation

class DigimonViewModel {
    
    init() {
        getDigimon()
    }
    
    var update: ( () -> Void )?
    
    var digimonModel: [Digimon]? = nil {
        didSet {
            update?()
        }
    }
    
    func getDigimon() {
        ApiManager.shared.fetchDigimon(completionFD: { digimon in
            self.digimonModel = digimon
        })
    }
    
    func getName(for index: Int) -> String? {
        digimonModel?[index].name?.uppercased()
    }
    func getImage(for index: Int) -> String? {
        digimonModel?[index].img
    }
    func getLevel(for index: Int) -> String? {
        "Level: \( digimonModel?[index].level?.uppercased() ?? "UNKNOWN" )"
    }
    
    func getCount() -> Int? {
        digimonModel?.count
    }
    
}
