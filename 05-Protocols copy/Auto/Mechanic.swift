//
//  Mechanic.swift
//  AccelAutoApp
//
//  Created by Kevin McKenney on 7/14/22.
//

import Foundation

struct Mechanic {
    private var shop: Shop
    
    
    
    func repair(_ vehicle: inout Vehicle) {
        vehicle.fix()
    }
    
}
