//
//  Vehicle.swift
//  protocolProject
//
//  Created by Luat on 8/9/21.
//

import Foundation

protocol Motorized {
    var id: UUID { get }
    var make: String { get }
    var model: String { get }
}

struct Vehicle: Motorized {
    let id = UUID()
    let make: String
    let model: String
}

struct Boat: Motorized {
    var id: UUID
    var make: String
    var model: String
    
    var sqFt: Int
}
