//
//  Vehicle.swift
//  Accel-Auto
//
//  Created by Maher Damouni on 7/14/22.
//

import Foundation

// stores vehicle(s) information/issue/test results to queue
  // make
  // model
  // vehicle id
  // test results
  // repaired?

struct Vehicle {
    var make: String = "insert vehicle make"
    var model: String = "insert vehicle model"
    var id: Int = 0
    var testResults: String = "insert test notes"
    var inspected: Bool = false
    var repaired: Bool = false
    var issue: String = "no issue declared yet"
    var issueDeclared: Bool = false
    var brakeIssue: String = "customer sets brake issue"
    var brakeIssueDeclared: Bool = false
    
    mutating func setIdMakeModel(vehicleMake: String, vehicleModel: String, vehicleId: Int) {
        
        id = vehicleId
        make = vehicleMake
        model = vehicleModel
    }
    
}
