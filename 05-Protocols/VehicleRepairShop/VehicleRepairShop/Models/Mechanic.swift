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
    
    
    // 1. The mechanic should be able to view both the inspection list and repairs list, including the following information:
       // a. ID of the vehicle tested
       // b. Make and model of the vehicle
    var listOfVehiclesToWorkOnNext: [Vehicle]   // TODO: I somehow need to reference the list in the controller
    
    // 2. The mechanic will always service the both the inspections list and repairs list on a first-come, first serve basis.
    func findNextVehicleToWorkOn(listOfVehicles: [Vehicle]) -> Vehicle {
        return listOfVehicles[0]
    }
    
    // 3. The mechanic needs a way to run the automated inspection(s) requested by the customer on the next vehicle in the inspections list.
       // a. When the inspection(s) are complete, the vehicle information and test results should be shown, and the vehicle automatically either removed from the shop or moved to the repairs list.
    func checkInspection() {
        // TODO: runInspections function in the Controller?
    }
    
    // 4. The mechanic needs a way to mark a vehicle as repaired from the repairs list.
       // a. When the repair(s) are marked complete, the vehicle should be moved to the inspection list.
    func markVehicleAsRepaired(vehicle: inout Vehicle) {
        vehicle.brakingNeedsRepairs = false
        vehicle.accelerationNeedsRepairs = false
    }
    
}
