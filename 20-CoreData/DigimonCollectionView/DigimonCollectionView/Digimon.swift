//
//  Digimon.swift
//  DigimonCollectionView
//
//  Created by Spencer Hurd on 7/30/22.
//

import Foundation

struct Digimon: Decodable {
    let name: String?
    let img: String?
    let level: String?
    
    // TODO: partial fix to remove from favorites issue?
    var favoriteId: Int?
//    var isFavorite: Bool?
}

/*
 SAMPLE DATA:
 [
   {
     "name": "Koromon",
     "img": "https://digimon.shadowsmith.com/img/koromon.jpg",
     "level": "In Training"
   },
   {
     "name": "Tsunomon",
     "img": "https://digimon.shadowsmith.com/img/tsunomon.jpg",
     "level": "In Training"
   },
   {
     "name": "Yokomon",
     "img": "https://digimon.shadowsmith.com/img/yokomon.jpg",
     "level": "In Training"
   }
 ]
 */
