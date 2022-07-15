//
//  File.swift
//  Accel-Auto
//
//  Created by Maher Damouni on 7/14/22.
//

import Foundation

struct Mechanic {
    
    mutating func setIssue(issue: String, vehicle: inout Vehicle, queue: inout Queue) {
      
        // expects issue to be "inspect" or "repair"
        vehicle.issue = issue
        vehicle.issueDeclared = true
        queue.addToQueue(vehicle: vehicle, issue: issue)
    }
    
    mutating func inspectVehicle(vehicle: inout Vehicle, queue: inout Queue, passed: Bool) {
        
        if passed == true {
            vehicle.inspected = true
            print(vehicle.id, vehicle.make, vehicle.model, vehicle.testResults)
            queue.removeFromQueue(issue: "inspect")
        } else {
            queue.addToQueue(vehicle: vehicle, issue: "repair")
            print(vehicle.id, vehicle.make, vehicle.model, vehicle.testResults)
            queue.removeFromQueue(issue: "inspect")
        }
    }
    
    mutating func repairVehicle(vehicle: inout Vehicle, queue: inout Queue, passed: Bool) {
        
        if passed == true {
            vehicle.repaired = true
            queue.addToQueue(vehicle: vehicle, issue: "inspect")
            print(vehicle.id, vehicle.make, vehicle.model, vehicle.testResults)
            queue.removeFromQueue(issue: "repair")
        } else {
            vehicle.repaired = false
            queue.addToQueue(vehicle: vehicle, issue: "repair")
            print(vehicle.id, vehicle.make, vehicle.model, vehicle.testResults)
            queue.removeFromQueue(issue: "repair")
        }
    }
    
    mutating func addVehicleToInspectOrRepair(vehicle: inout Vehicle, queue: inout Queue, addTo: String) {
        
        if addTo == "inspect" {
            queue.addToQueue(vehicle: vehicle, issue: "inspect")
            queue.removeFromQueue(issue: "vehicleQueue")
        } else {
            queue.addToQueue(vehicle: vehicle, issue: "repair")
            queue.removeFromQueue(issue: "vehicleQueue")
        }
    }
    
    mutating func testNotes(notes: String, vehicle: inout Vehicle) {
        
        vehicle.testResults = notes
    }
    
}
