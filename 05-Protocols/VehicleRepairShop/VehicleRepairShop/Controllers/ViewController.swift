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
        var kiaOwner = Customer(id: 0, firstName: "Spencer", lastName: "Hurd", hasPossessionOfVehicle: true)
        let accelerationNeedsRepairs = Bool.random()
        let brakingNeedsRepairs = Bool.random()
        var kiaOptima = Vehicle(id: 0, make: "Kia", model: "Optima", customer: kiaOwner, accelerationNeedsToBeInspected: false, accelerationNeedsRepairs: accelerationNeedsRepairs, brakingNeedsToBeInspected: true, brakingNeedsRepairs: brakingNeedsRepairs)
        // 1. A customer brings a vehicle to the shop.
        // 2. The customer will indicate what inspections should be performed – acceleration, braking, or both.
        addVehicleToShop(vehicle: &kiaOptima)
        var nextCar: Vehicle = nextVehicleToWorkOn[0]
        while nextVehicleToWorkOn.count > 0 {
            if nextCar.accelerationNeedsToBeInspected == true || nextCar.brakingNeedsToBeInspected == true {
                runInspections(vehicle: &nextCar)
            } else if nextCar.accelerationNeedsRepairs == true || nextCar.brakingNeedsRepairs == true {
                runRepairs(vehicle: &nextCar)
            } else {
                print("Error 1")
            }
        }
        kiaOwner.hasPossessionOfVehicle = true
        print("Vehicle has been returned to owner")
    }
    
    // 1. A customer brings a vehicle to the shop.
    // add vehicle to shop
    func addVehicleToShop(vehicle: inout Vehicle) {
        vehicle.customer.hasPossessionOfVehicle = false
        vehiclesInShop.append(vehicle)
        print("The following vehicle has been added to the shop - Make: \(vehicle.make) Model: \(vehicle.model) id: \(vehicle.id)")
        // 2. The customer will indicate what inspections should be performed – acceleration, braking, or both.
        if (vehicle.accelerationNeedsToBeInspected == true || vehicle.brakingNeedsToBeInspected == true) {
            // 3. The mechanic will add the vehicle to the inspection queue.
            print("The vehicle with id \(vehicle.id) needs to be inspected")
            addVehicleToInspectionList(vehicle: vehicle)
        }
    }
    
    // 3. The mechanic will add the vehicle to the inspection queue.
    func addVehicleToInspectionList(vehicle: Vehicle) {
        listOfVehiclesToInspect.append(vehicle)
        addVehicleToWorkList(vehicle: vehicle)
        print("Vehicle with id \(vehicle.id) added to the inspection list")
    }
    // add vehicle to repair list
    func addVehicleToRepairList(vehicle: Vehicle) {
        listOfVehiclesToRepair.append(vehicle)
        addVehicleToWorkList(vehicle: vehicle)
        print("Vehicle with id \(vehicle.id) added to the repair list")
    }
    // add vehicle to work list
    func addVehicleToWorkList(vehicle: Vehicle) {
        nextVehicleToWorkOn.append(vehicle)
    }
    
    // 4. The mechanic will run the specified inspections on the vehicle.
       // a. If all inspections pass, the vehicle is returned to the customer and removed from the shop.
       // b. If any of the inspections fail, the vehicle should be moved to a repairs queue.
    func runInspections(vehicle: inout Vehicle) {
        // If all inspections pass, the vehicle is returned to the customer and removed from the shop.
        vehicle.accelerationNeedsToBeInspected = false
        vehicle.brakingNeedsToBeInspected = false
        print("Completed inspections for vehicle with id \(vehicle.id)")
        if (vehicle.accelerationNeedsRepairs == false && vehicle.brakingNeedsRepairs == false) {
            vehicle.customer.hasPossessionOfVehicle = true
            print("Vehicle returned to customer \(vehicle.customer.firstName + vehicle.customer.lastName)")
            nextVehicleToWorkOn.remove(at: 0)
            for (index, v) in vehiclesInShop.enumerated() {
                if (v.id == vehicle.id) {
                    vehiclesInShop.remove(at: index)
                }
            }
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
            listOfVehiclesToRepair.append(vehicle)
            for (index, v) in listOfVehiclesToInspect.enumerated() {
                if (v.id == vehicle.id) {
                    listOfVehiclesToInspect.remove(at: index)
                }
            }
        }
    }
    
    func runRepairs(vehicle: inout Vehicle) {
        vehicle.brakingNeedsRepairs = false
        vehicle.accelerationNeedsRepairs = false
        print("The vehicle with id \(vehicle.id) has been repaired")
        moveVehicleToInspectionList(vehicle: vehicle)
    }
    
    // 5. When the mechanic finishes the necessary repairs, the car will be added back to the inspections queue.
    func moveVehicleToInspectionList(vehicle: Vehicle) {
        listOfVehiclesToInspect.append(vehicle)
        for (index, v) in listOfVehiclesToRepair.enumerated() {
            if v.id == vehicle.id {
                listOfVehiclesToRepair.remove(at: index)
                nextVehicleToWorkOn.remove(at: index)
            }
        }
    }


}

