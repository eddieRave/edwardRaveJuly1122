//
//  Model.swift
//  CollectionViewAssignment
//
//  Created by Maher Damouni on 7/30/22.
//

import Foundation
import UIKit

struct Dog: Decodable {
    
    let message: [String]
}

struct Breed: Decodable {
    
    let message: [String: [String]]
}
