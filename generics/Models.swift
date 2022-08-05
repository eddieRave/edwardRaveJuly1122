//
//  Models.swift
//  generics
//
//  Created by Rave Bizz on 8/3/22.
//

import Foundation


struct Weapon: Decodable{
    let name: String?
    let assests: WeaponAsset?
    let attack: Attack?
    let elements: [Element]?
}

struct Attack: Decodable{
    let dispay: Int?
    let raw: Int?
}

struct Element: Decodable{
    let type: String?
    let damage: Int?
    
}

struct WeaponAsset: Decodable{
    let image: String?
}




struct ArmorSet: Decodable{
    let name: String?
//    let pieces: [Armor]?
    
}
struct Armor: Decodable{
    let name: String?
    let assets: ArmorAsset?
}

struct ArmorAsset: Decodable{
    let imageMale: String?
    let imageFemale: String?
}

/*
 [
   {
     "id": 1,
     "name": "Leather",
     "rank": "low",
     "pieces": [
       {
         "id": 1,
         "slug": "leather-headgear",
         "name": "Leather Headgear",
         "type": "head",
         "rank": "low",
         "rarity": 1,
         "armorSet": 1,
         "attributes": {...},
         "skills": [...],
         "assets": {
           "imageMale": "https://assets.mhw-db.com/armor/...",
           "imageFemale": "https://assets.mhw-db.com/armor/..."
         }
       }
     ],
     "bonus": null
   }
 ]
 */
/*
 [
   {
     "id": 1,
     "name": "Buster Sword 1",
     "type": "great-sword",
     "rarity": 1,
     "attack": {...},
     "elderseal": null,
     "attributes": {...},
     "damageType": "sever",
     "durability": [...],
     "slots": [...],
     "elements": [...],
     "crafting": {...},
     "assets": {...}
   }
 ]
 */
