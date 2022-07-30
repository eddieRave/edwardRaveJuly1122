//
//  Digimon.swift
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

struct Digimon: Decodable {
    
    let name: String
    let img: String
    let level: String
    
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
