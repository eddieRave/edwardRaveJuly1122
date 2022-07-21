//
//  Mechanic.swift
//  Accel Shop
//
//  Created by Joel Maldonado on 7/14/22.
//

import Foundation

class Mechanic {
    func runInspections(inspectionQueue: VehicleQueue, repairQueue: VehicleQueue) {
        while(!inspectionQueue.isEmpty()) {
            if let vehicle = inspectionQueue.dequeue() {
                print("Vehicle ID: \(vehicle.id)")
                print("Make: \(vehicle.make)")
                print("Model: \(vehicle.model)")
                
                for inspection in vehicle.reqInspections {
                    var inspectionString = ""
                    
                    switch(inspection.type) {
                    case .Acceleration:
                        inspectionString += "Acceleration"
                        
                    case .Braking:
                        inspectionString += "Brake"
                    }
                    
                    inspectionString += " Inspection: "
                    
                    if(inspect(inspection) == false) {
                        inspectionString += "FAILED"
                        vehicle.setBroken(true)
                        repairQueue.enqueue(vehicle)
                    } else {
                        vehicle.removeInspection(inspection)
                        inspectionString += "PASSED"
                    }
                    
                    print("\(inspectionString)")
                }
            }
            
            print()
        }
    }
    
    func runRepairs(inspectionQueue: VehicleQueue, repairQueue: VehicleQueue) {
        while(!repairQueue.isEmpty()) {
            if let vehicle = repairQueue.dequeue() {
                for i in 0 ..< vehicle.reqInspections.count {
                    if(!vehicle.reqInspections[i].checksOut) {
                        repair(&vehicle.reqInspections[i])
                    }
                }
                
                vehicle.setBroken(false)
                inspectionQueue.enqueue(vehicle)
            }
        }
    }
    
    func inspect(_ inspection: Inspection) -> Bool {
        inspection.checksOut
    }
    
    func repair(_ inspection: inout Inspection) {
        inspection.setChecksOut(true)
    }
}
