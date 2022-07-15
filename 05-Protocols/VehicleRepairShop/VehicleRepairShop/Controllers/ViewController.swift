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
        // CUSTOMER'S VEHICLE:
        let kiaOptima = Vehicle(id: 0, make: "Kia", model: "Optima", accelerationNeedsToBeInspected: false, accelerationNeedsRepairs: accelerationNeedsRepairs, brakingNeedsToBeInspected: true, brakingNeedsRepairs: brakingNeedsRepairs)
        // CUSTOMER:
        var kiaOwner = Customer(id: 0, firstName: "Spencer", lastName: "Hurd", vehicle: kiaOptima, hasPossessionOfVehicle: true)
        
        // SHOP:
        let shop = Shop()
        // shop method
        shop.customerEntersTheShop(customer: &kiaOwner)
        
    }
}
