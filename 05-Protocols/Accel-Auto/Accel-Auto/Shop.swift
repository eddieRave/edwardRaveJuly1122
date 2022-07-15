//
//  Shop.swift
//  Accel-Auto
//
//  Created by Maher Damouni on 7/14/22.
//

import Foundation

// handles customers picking issue

struct Shop {
    
    mutating func setIssue(brakeIssue: String, vehicle: inout Vehicle, queue: inout Queue) {
        // vehicle issue accelerated, decelerated, or both
        // inputted by customer
        vehicle.brakeIssue = brakeIssue
        vehicle.brakeIssueDeclared = true
        queue.addToQueue(vehicle: vehicle, issue: brakeIssue)
    }
}
