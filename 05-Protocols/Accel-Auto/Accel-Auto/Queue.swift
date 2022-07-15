//
//  Inspect.swift
//  Accel-Auto
//
//  Created by Maher Damouni on 7/14/22.
//

import Foundation

// stores vehicle in inspection queue
  // if inspection fails, automatically adds vehicle to repair queue
struct Queue {
    
    var vehicleQueue: [Vehicle] = []
    var inspectionQueue: [Vehicle] = []
    var repairQueue: [Vehicle] = []
    
    mutating func addToQueue(vehicle: Vehicle, issue: String) {
        
        if issue == "inspect" {
            inspectionQueue.insert(vehicle, at: 0)
        } else if issue == "repair" {
            repairQueue.insert(vehicle, at: 0)
        } else {
            vehicleQueue.insert(vehicle, at: 0)
        }
    }
    
    mutating func removeFromQueue(issue: String) {
        
        if issue == "inspect" {
            inspectionQueue.remove(at: inspectionQueue.count - 1)
        } else if issue == "repair" {
            repairQueue.remove(at: inspectionQueue.count - 1)
        } else {
            vehicleQueue.remove(at: inspectionQueue.count - 1)
        }
    }
    
    func nextInQueue(issue: String) -> Vehicle {
        
        if issue == "inspect" {
            return inspectionQueue[inspectionQueue.count - 1]
        } else if issue == "repair" {
            return repairQueue[inspectionQueue.count - 1]
        } else {
            return vehicleQueue[inspectionQueue.count - 1]
        }
    }
    
}
