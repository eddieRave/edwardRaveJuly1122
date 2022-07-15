//
//  Vehicle.swift
//  VehicleRepairShop
//
//  Created by Spencer Hurd on 7/14/22.
//

import Foundation

struct Vehicle {
    var id: Int    // ALTERNATE var id = UUID().uuidString
    var make: String
    var model: String
    var accelerationNeedsToBeInspected: Bool = false
    var accelerationNeedsRepairs: Bool? = false
    var brakingNeedsToBeInspected: Bool = false
    var brakingNeedsRepairs: Bool? = false
}
