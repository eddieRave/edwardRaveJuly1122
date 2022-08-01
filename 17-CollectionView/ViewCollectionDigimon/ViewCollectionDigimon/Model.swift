//
//  Model.swift
//  ViewCollectionDigimon
//
//  Created by Rave Bizz 41 on 7/29/22.
//

import Foundation

struct Digimon: Decodable {
    let name: String?
    let img: String?
    let level: String?
}

enum Level: String, Decodable {
    case armor = "Armor"
    case champion = "Champion"
    case fresh = "Fresh"
    case inTraining = "In Training"
    case mega = "Mega"
    case rookie = "Rookie"
    case training = "Training"
    case ultimate = "Ultimate"
    
}

/* One entry example
 
{
   "name": "Koromon",
   "img": "https://digimon.shadowsmith.com/img/koromon.jpg",
   "level": "In Training"
 }
*/
