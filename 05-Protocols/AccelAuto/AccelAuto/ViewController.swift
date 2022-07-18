//
//  ViewController.swift
//  AccelAuto
//
//  Created by Rave Bizz 41 on 7/14/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Test to see if the program is working
        print("Hello World!")
        
        //----------------------------------------------------------
        // Testing to see if any of the structs are working
        //----------------------------------------------------------
        let myVehicle = Vehicle(id: 1234, make: "Toyota", model: "Corolla")
        let myCustomer = Customer(vehicle: myVehicle, inspection: Inspection.braking, inspectionState: true)
        
        // myVehicle2 needs to be repaired
        let myVehicle2 = Vehicle(id: 5678, make: "Honda", model: "Civic")
        let myCustomer2 = Customer(vehicle: myVehicle2, inspection: Inspection.acceleration, inspectionState: false)
        
        let myVehicle3 = Vehicle(id: 9821, make: "Nissan", model: "Sentra")
        let myCustomer3 = Customer(vehicle: myVehicle3, inspection: Inspection.acceleration, inspectionState: true)
        
        // Create a mechanic
        var myMechanic = Mechanic()
        
        // Add customer info to inspection queue
        myMechanic.addToInspectionQueue(customer: myCustomer)
        myMechanic.addToInspectionQueue(customer: myCustomer2)
        myMechanic.addToInspectionQueue(customer: myCustomer3)
        
        // Repair any given issues
        myMechanic.addToRepairQueue()
        
    }


}

