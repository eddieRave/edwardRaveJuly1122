//
//  Vehicle.swift
//  Accel Shop
//
//  Created by Joel Maldonado on 7/14/22.
//

import Foundation

class Vehicle {
    let make: String
    let model: String
    let id: String
    var broken: Bool = false
    
    var reqInspections: [Inspection] = []
    
    init(make: String, model: String, id: String, inspections: Inspection...) {
        self.make = make
        self.model = model
        self.id = id
        
        for inspection in inspections {
            reqInspections.append(inspection)
        }
    }
    
    func setBroken(_ status: Bool) {
        broken = status
    }
    
    func removeInspection(_ inspection: Inspection) {
        if let index = reqInspections.firstIndex(where: {$0 == inspection}) {
            reqInspections.remove(at: index)
        }
    }
}
