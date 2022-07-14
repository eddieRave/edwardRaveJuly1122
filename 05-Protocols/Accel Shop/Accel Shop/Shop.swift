//
//  Shop.swift
//  Accel Shop
//
//  Created by Joel Maldonado on 7/14/22.
//

import Foundation

class Shop {
    let inspectionQueue = VehicleQueue()
    let repairQueue = VehicleQueue()
    
    let mechanic = Mechanic()
    
    func add(vehicle: Vehicle) {
        inspectionQueue.enqueue(vehicle)
    }
    
    func completeWork() {
        while(!inspectionQueue.isEmpty() || !repairQueue.isEmpty()) {
            mechanic.runInspections(inspectionQueue: inspectionQueue, repairQueue: repairQueue)
            mechanic.runRepairs(inspectionQueue: inspectionQueue, repairQueue: repairQueue)
        }
    }
}
