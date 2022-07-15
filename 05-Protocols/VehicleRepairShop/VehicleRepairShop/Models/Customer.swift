//
//  Customer.swift
//  VehicleRepairShop
//
//  Created by Spencer Hurd on 7/14/22.
//

import Foundation

struct Customer: Identity {
    var id: Int
    var firstName: String
    var lastName: String
    var vehicle: Vehicle
    var hasPossessionOfVehicle: Bool
    
}
