//
//  DigimonViewModel.swift
//  DigimonCollectionView
//
//  Created by Spencer Hurd on 7/30/22.
//

import Foundation

class DigimonViewModel: Favoritable {
    
    var update: ( () -> Void )?
    
    var digimonArray: [Digimon]? = nil {
        didSet {
            update?()
        }
    }
    
    var favorites: [Digimon] = []
//    {
//        didSet {
//            for digi in favorites {
//                print("Favorites: \(digi.name ?? "")")
//            }
//        }
//    }
    
    init() {
        getDigimon()
    }
    
    func getDigimon() {
        ApiManager.shared.fetchDigimon(completionFD: { digimon in
            self.digimonArray = digimon
        })
    }
    
    func getName(for index: Int) -> String? {
        digimonArray?[index].name?.uppercased()
    }
    func getImage(for index: Int) -> String? {
        digimonArray?[index].img
    }
    func getLevel(for index: Int) -> String? {
        "Level: \( digimonArray?[index].level?.uppercased() ?? "UNKNOWN" )"
    }
    
    func getDigimonArrayCount() -> Int? {
        digimonArray?.count
    }
    
    func getFavoritesCount() -> Int? {
        favorites.count
    }
    
    func addToFavorites(digimonIndexPath: Int) {
        guard let digimon = digimonArray?[digimonIndexPath] else {
            return
        }
        favorites.append(digimon)
    }
    
}
