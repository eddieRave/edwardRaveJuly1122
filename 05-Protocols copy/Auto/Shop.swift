//
//  Shop.swift
//  AccelAutoApp
//
//  Created by Kevin McKenney on 7/14/22.
//

import Foundation

class Shop {
    var repairs: [Vehicle] = []
    var inspections: [Vehicle] = []
    var returned: [Vehicle] = []
    
    var mechanics: [Mechanic] = []
    
    
    
    func hire(_ mechanic: Mechanic) {
        mechanics.append(mechanic)
    }
    
    func addVehicle(_ vehicle: Vehicle) {
        inspections.append(vehicle)
    }
    
    func inspectNext() {
        if !inspections.isEmpty {
            if !inspections[0].isWorking() {
                repairs.append(inspections[0])
            } else {
                returned.append(inspections[0])
            }
            
            inspections.removeFirst()
        }
    }
    
    func repairNext() {
        if !repairs.isEmpty && !mechanics.isEmpty {
            mechanics[0].repair(&repairs[0])
            inspections.append(repairs[0])
            repairs.removeFirst()
        }
    }
    
    func printInspections() {
        inspections.forEach({ print($0) })
    }
    
    func printRepairs() {
        inspections.forEach({ print($0) })
    }
    
}
