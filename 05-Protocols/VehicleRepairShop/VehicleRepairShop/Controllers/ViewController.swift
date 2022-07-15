//
//  ViewController.swift
//  VehicleRepairShop
//
//  Created by Spencer Hurd on 7/14/22.
//

import UIKit

class ViewController: UIViewController {
    
    var vehiclesInShop: [Vehicle] = []
    var nextVehicleToWorkOn: [Vehicle] = []
    var listOfVehiclesToInspect: [Vehicle] = []
    var listOfVehiclesToRepair: [Vehicle] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // 1. A customer brings a vehicle to the shop.
    // 2. The customer will indicate what inspections should be performed – acceleration, braking, or both.
    func updateInspectionsToBePerformed(vehicle: inout Vehicle, inspectAcceleration: Bool, inspectBraking: Bool) {
        // add vehicle to shop
        vehicle.customer.hasPossessionOfVehicle = false
        vehiclesInShop.append(vehicle)
        // update vehicle's inspection needs
        vehicle.accelerationNeedsToBeInspected = inspectAcceleration
        vehicle.brakingNeedsToBeInspected = inspectBraking
        // add to inspection list
        if (inspectAcceleration == true || inspectBraking == true) {
            addVehicleToInspectionList(vehicle: vehicle)
        }
    }
    
    // 3. The mechanic will add the vehicle to the inspection queue.
    func addVehicleToInspectionList(vehicle: Vehicle) {
        listOfVehiclesToInspect.append(vehicle)
        addVehicleToWorkList(vehicle: vehicle)
    }
    // add vehicle to repair list
    func addVehicleToRepairList(vehicle: Vehicle) {
        listOfVehiclesToRepair.append(vehicle)
        addVehicleToWorkList(vehicle: vehicle)
    }
    // add vehicle to work list
    func addVehicleToWorkList(vehicle: Vehicle) {
        nextVehicleToWorkOn.append(vehicle)
    }
    
    // 4. The mechanic will run the specified inspections on the vehicle.
       // a. If all inspections pass, the vehicle is returned to the customer and removed from the shop.
       // b. If any of the inspections fail, the vehicle should be moved to a repairs queue.
    func runInspections(vehicle: inout Vehicle, inspectAcceleration: Bool, inspectBraking: Bool) {
        // If all inspections pass, the vehicle is returned to the customer and removed from the shop.
        if (inspectAcceleration == true && inspectBraking == true) {
            vehicle.customer.hasPossessionOfVehicle = true
            nextVehicleToWorkOn.remove(at: 0)
            for (index, v) in vehiclesInShop.enumerated() {
                if (v.id == vehicle.id) {
                    vehiclesInShop.remove(at: index)
                }
            }
        }
        // If any of the inspections fail, the vehicle should be moved to a repairs queue.
        else {
            listOfVehiclesToRepair.append(vehicle)
            for (index, v) in listOfVehiclesToInspect.enumerated() {
                if (v.id == vehicle.id) {
                    listOfVehiclesToInspect.remove(at: index)
                }
            }
        }
        
    }
    
    // 5. When the mechanic finishes the necessary repairs, the car will be added back to the inspections queue.
    func moveVehicleToInspectionList(vehicle: Vehicle) {
        listOfVehiclesToInspect.append(vehicle)
        for (index, v) in listOfVehiclesToRepair.enumerated() {
            if v.id == vehicle.id {
                listOfVehiclesToRepair.remove(at: index)
            }
        }
    }

}

