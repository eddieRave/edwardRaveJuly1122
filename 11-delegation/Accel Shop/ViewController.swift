//
//  ViewController.swift
//  Accel Shop
//
//  Created by Joel Maldonado on 7/14/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let shop = Shop()
        let acceleration = Inspection(type: .Acceleration)
        let brake = Inspection(type: .Braking)
        let vehicle = Vehicle(make: "Ford", model: "Expedition", id: "100", inspections: acceleration)
        let vehicle2 = Vehicle(make: "Toyota", model: "Camry", id: "200", inspections: brake)
        let vehicle3 = Vehicle(make: "Honda", model: "Civic", id: "300", inspections: acceleration, brake)
        shop.add(vehicle: vehicle)
        shop.add(vehicle: vehicle2)
        shop.add(vehicle: vehicle3)
        shop.completeWork()
    }


}

