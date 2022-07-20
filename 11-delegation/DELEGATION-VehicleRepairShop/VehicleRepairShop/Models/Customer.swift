//
//  Customer.swift
//  VehicleRepairShop
//
//  Created by Spencer Hurd on 7/14/22.
//

import Foundation

// MARK: Added this protocol to implement delegate pattern
protocol VehicleAble {
    var vehicle: Vehicle { get set }
}

// MARK: Conform to protocol
struct Customer: Identity, VehicleAble {
    var id: Int
    var firstName: String
    var lastName: String
    var vehicle: Vehicle // MARK: have to have this variable to conform to VehicleAble
    var hasPossessionOfVehicle: Bool
}
