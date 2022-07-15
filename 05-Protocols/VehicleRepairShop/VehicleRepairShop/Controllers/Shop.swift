//
//  Shop.swift
//  VehicleRepairShop
//
//  Created by Spencer Hurd on 7/14/22.
//

import Foundation

class Shop {
    
    var nextVehicleToWorkOn: [Vehicle] = []
    var listOfVehiclesToInspect: [Vehicle] = []
    var listOfVehiclesToRepair: [Vehicle] = []
    var mechanic: Mechanic = Mechanic(id: 007, firstName: "James", lastName: "Bond")
    
    func customerEntersTheShop(customer: inout Customer) {
        print("Customer enters the shop")
        addVehicleToShop(vehicle: &customer.vehicle)
    }
    
    // 1. A customer brings a vehicle to the shop.
    func addVehicleToShop(vehicle: inout Vehicle) {
        print("The following vehicle has been added to the shop - Make: \(vehicle.make) Model: \(vehicle.model) id: \(vehicle.id)")
        // 2. The customer will indicate what inspections should be performed – acceleration, braking, or both.
        reviewInspectionsNeeded(vehicle: vehicle)
    }
    
    func reviewInspectionsNeeded(vehicle: Vehicle) {
        if (vehicle.accelerationNeedsToBeInspected == true || vehicle.brakingNeedsToBeInspected == true) {
            // 3. The mechanic will add the vehicle to the inspection queue.
            print("The vehicle with id \(vehicle.id) needs to be inspected")
            mechanic.addVehicleToInspectionList(vehicle: vehicle, inspectionList: &listOfVehiclesToInspect, workList: &nextVehicleToWorkOn)
        }
    }
    
}
