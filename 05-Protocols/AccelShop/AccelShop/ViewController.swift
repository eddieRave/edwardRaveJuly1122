//
//  ViewController.swift
//  AccelShop
//
//  Created by Luat on 4/29/22.
//

import UIKit

class ViewController: UIViewController {
    let shop = AccelShop()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let aVechicle = Vehicle(make: "a", model: "aModel")
        let bVechicle = Vehicle(make: "b", model: "bModel")
        let cVechicle = Vehicle(make: "c", model: "cModel")
        var customerA = Customer(name: "Customer A")
        customerA.vehicles = [aVechicle]
        var customerB = Customer(name: "Customer b")
        customerB.vehicles = [bVechicle, cVechicle]
        shop.customers = [customerA, customerB]
        
        shop.customers.forEach { customer in
            shop.receive(vehicles: customer.vehicles, name: customer.name)
        }
        
        let mechanicA = Mechanic()
        let mechanicB = Mechanic()
        shop.mechanics = [mechanicA, mechanicB]
        
        shop.start()
        
    }
    


}

