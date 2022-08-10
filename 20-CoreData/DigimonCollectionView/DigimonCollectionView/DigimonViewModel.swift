//
//  DigimonViewModel.swift
//  DigimonCollectionView
//
//  Created by Spencer Hurd on 7/30/22.
//

import Foundation

protocol AddFavoriteProtocol {
    var update: ( () -> Void )? { get set }
    var favoritesIdArray: [Int] { get set }
    func getDigimonData()
    func getDigimon(index: Int) -> Digimon?
    func getFavoritesIdArrayCount() -> Int
    func addIdToFavorites(indexPathRow: Int)
    func removeFromFavories(indexPathRow: Int)
    
    func getName(for index: Int) -> String?
    func getImage(for index: Int) -> String?
    func getLevel(for index: Int) -> String?
}

class DigimonViewModel: AddFavoriteProtocol {
    
    // Arrays
    var digimonArray: [Digimon]? = nil {
        didSet {
            update?()
        }
    }
    var favoritesIdArray: [Int] = [] {
        didSet {
            print("Favorites ID: \(favoritesIdArray)")
            convertArrayOfIntToString()
            print("String copy = \(stringCopyOfFavoritesIdArray)")
//            update?()
        }
    }
    var stringCopyOfFavoritesIdArray = ""
    
    // Update / reloadData()
    var update: ( () -> Void )?
    
    init() {
        getDigimonData()
    }
    
    // API data
    func getDigimonData() {
        ApiManager.shared.fetchDigimon(completionFD: { digimon in
            self.digimonArray = digimon
        })
    }
    
    // Digimon details
    func getDigimon(index: Int) -> Digimon? {
        let digimon = digimonArray?[index]
        return digimon
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
    
    // Count
    func getDigimonArrayCount() -> Int {
        digimonArray?.count ?? 0
    }
    func getFavoritesIdArrayCount() -> Int {
        favoritesIdArray.count
    }
    
    // Add/remove favorites
    func addIdToFavorites(indexPathRow: Int) {
        if var digimon = digimonArray?[indexPathRow] {
            digimon.favoriteId = indexPathRow
            favoritesIdArray.append(indexPathRow)
            print("Added index \(indexPathRow) to Favorites array.")
        }
    }
    func removeFromFavories(indexPathRow: Int) {
        var copyOfArray = favoritesIdArray
        if favoritesIdArray.contains(indexPathRow) {
            for i in 0..<favoritesIdArray.count {
                if favoritesIdArray[i] == indexPathRow {
                    copyOfArray.remove(at: i)
                    print("Removed index \(indexPathRow) from Favorites array.")
                }
            }
        }
        favoritesIdArray = copyOfArray
    }
    
    // Convert [Int] to String to save in CoreData
    func convertArrayOfIntToString() {
        stringCopyOfFavoritesIdArray = ""
        for num in favoritesIdArray {
            stringCopyOfFavoritesIdArray.append(String(num) + ",")
        }
        if stringCopyOfFavoritesIdArray.last == "," {
            stringCopyOfFavoritesIdArray.removeLast()
        }
    }
    func convertStringToArrayOfInt(stringOfInt: String) -> [Int] {
        let convertedArr = stringOfInt.components(separatedBy: ",")
        let originalArray = convertedArr.map { Int($0) ?? 0 }
        return originalArray
    }
    
}
