//
//  Mechanic.swift
//  VehicleRepairShop
//
//  Created by Spencer Hurd on 7/14/22.
//

import Foundation

struct Mechanic: Identity {
    var id: Int
    var firstName: String
    var lastName: String
    
    
    
    // 3. The mechanic will add the vehicle to the inspection queue.
    func addVehicleToInspectionList(vehicle: Vehicle, inspectionList: inout [Vehicle], workList: inout [Vehicle]) {
        inspectionList.append(vehicle)
        addVehicleToWorkList(vehicle: vehicle, workList: &workList)
        print("Vehicle with id \(vehicle.id) added to the inspection list")
    }
    // add vehicle to repair list
    func addVehicleToRepairList(vehicle: Vehicle, repairList: inout [Vehicle], workList: inout [Vehicle]) {
        repairList.append(vehicle)
        addVehicleToWorkList(vehicle: vehicle, workList: &workList)
        print("Vehicle with id \(vehicle.id) added to the repair list")
    }
    // add vehicle to work list
    func addVehicleToWorkList(vehicle: Vehicle, workList: inout [Vehicle]) {
        workList.append(vehicle)
    }
    
    // 4. The mechanic will run the specified inspections on the vehicle.
       // a. If all inspections pass, the vehicle is returned to the customer and removed from the shop.
       // b. If any of the inspections fail, the vehicle should be moved to a repairs queue.
    func runInspections(vehicle: inout Vehicle, workList: inout [Vehicle], inspectList: inout [Vehicle], repairList: inout [Vehicle]) {
        // If all inspections pass, the vehicle is returned to the customer and removed from the shop.
        vehicle.accelerationNeedsToBeInspected = false
        vehicle.brakingNeedsToBeInspected = false
        print("Completed inspections for vehicle with id \(vehicle.id)")
        if (vehicle.accelerationNeedsRepairs == false && vehicle.brakingNeedsRepairs == false) {
            // return car to customer
            print("Vehicle returned to customer ")
            workList.remove(at: 0)
        }
        // If any of the inspections fail, the vehicle should be moved to a repairs queue.
        else {
            if vehicle.accelerationNeedsRepairs == false {
                print("Acceleration repairs needed for vehicle with id \(vehicle.id)")
            } else if vehicle.brakingNeedsRepairs == false {
                print("Braking repairs needed for vehicle with id \(vehicle.id)")
            } else {
                print("Error 2")
            }
            repairList.append(vehicle)
            for (index, v) in inspectList.enumerated() {
                if (v.id == vehicle.id) {
                    inspectList.remove(at: index)
                }
            }
        }
    }
    
    func runRepairs(vehicle: inout Vehicle, workList: inout [Vehicle], inspectList: inout [Vehicle], repairList: inout [Vehicle]) {
        vehicle.brakingNeedsRepairs = false
        vehicle.accelerationNeedsRepairs = false
        print("The vehicle with id \(vehicle.id) has been repaired")
        moveVehicleToInspectionList(vehicle: vehicle, workList: &workList, inspectList: &inspectList, repairList: &repairList)
    }
    
    // 5. When the mechanic finishes the necessary repairs, the car will be added back to the inspections queue.
    func moveVehicleToInspectionList(vehicle: Vehicle, workList: inout [Vehicle], inspectList: inout [Vehicle], repairList: inout [Vehicle]) {
        inspectList.append(vehicle)
        for (index, v) in repairList.enumerated() {
            if v.id == vehicle.id {
                repairList.remove(at: index)
                workList.remove(at: index)
            }
        }
    }
    
}
