//
//  VehicleQueue.swift
//  Accel Shop
//
//  Created by Joel Maldonado on 7/14/22.
//

import Foundation

class VehicleQueue {
    var vehicles: [Vehicle] = []
    
    func enqueue(_ vehicle: Vehicle) {
        vehicles.append(vehicle)
    }
    
    func dequeue() -> Vehicle? {
        if(isEmpty()) {
            return nil
        }
        
        let tempEle = vehicles.first
        vehicles.remove(at: 0)
        return tempEle
    }
    
    func isEmpty() -> Bool {
        vehicles.isEmpty
    }
}
