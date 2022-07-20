//
//  ViewController.swift
//  VehicleRepairShop
//
//  Created by Spencer Hurd on 7/14/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Enter random variable for testing:
        let accelerationNeedsRepairs = Bool.random()
        let brakingNeedsRepairs = Bool.random()
        print("Testing argument values")
        print("   - Acceleration repairs needed: \(accelerationNeedsRepairs)")
        print("   - Braking repairs needed: \(accelerationNeedsRepairs)")
        // CUSTOMER'S VEHICLE:
        let kiaOptima = Vehicle(id: 0, make: "Kia", model: "Optima", accelerationNeedsToBeInspected: false, accelerationNeedsRepairs: accelerationNeedsRepairs, brakingNeedsToBeInspected: true, brakingNeedsRepairs: brakingNeedsRepairs)
        // CUSTOMER:
        // MARK: Customer instance needs to conform to protocol
        var kiaOwner: VehicleAble = Customer(id: 0, firstName: "Spencer", lastName: "Hurd", vehicle: kiaOptima, hasPossessionOfVehicle: true)
        
        // SHOP:
        let shop = Shop()
        // shop method
        shop.customerEntersTheShop(customer: &kiaOwner)
        
    }
}
