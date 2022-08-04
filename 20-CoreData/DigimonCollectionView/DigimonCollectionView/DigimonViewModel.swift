//
//  DigimonViewModel.swift
//  DigimonCollectionView
//
//  Created by Spencer Hurd on 7/30/22.
//

import Foundation

protocol AddFavoriteProtocol {
    var update: ( () -> Void )? { get set }
    func getDigimon()
    func getName(for index: Int) -> String?
    func getImage(for index: Int) -> String?
    func getLevel(for index: Int) -> String?
    func getFavoritesCount() -> Int?
    func addToFavorites(digimonIndexPath: Int)
    func removeFromFavorites(digimonIndexPath: Int)
}

class DigimonViewModel: AddFavoriteProtocol {
    
    var update: ( () -> Void )?
    
    var digimonArray: [Digimon]? = nil {
        didSet {
            update?()
        }
    }
    
    var favorites: [Digimon] = [] {
        didSet {
            var favArray: [String] = []
            for digi in favorites {
                favArray.append(digi.name ?? "")
            }
            print("Favorites: \(favArray)")
//            update?()
        }
    }
    
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
    
    func removeFromFavorites(digimonIndexPath: Int) {
        favorites.remove(at: digimonIndexPath)
    }
    
}
