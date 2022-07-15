//
//  Vehicle.swift
//  AccelAutoApp
//
//  Created by Kevin McKenney on 7/14/22.
//

import Foundation

/// test changes
struct Vehicle: Identifiable, Hashable, CustomStringConvertible {
    private static var nextID = 0
    var id: Int
    var description: String

    private var make: String
    private var model: String
    
    private var brakingWorks: Bool
    private var accelerationWorks: Bool
    
    private var issue: Issue
    
    init(make: String, model: String, brakingWorks: Bool = true, accelerationWorks: Bool = true, issue: Issue) {
        id = Vehicle.nextID
        Vehicle.nextID += 1
        description = "\(make) \(model) ID: \(id)"
        
        self.make = make
        self.model = model
        
        self.brakingWorks = brakingWorks
        self.accelerationWorks = accelerationWorks
        
        self.issue = issue
    }
    
    func isWorking() -> Bool {
        switch issue {
        case .none:
            return true
        case .braking:
            return brakingWorks
        case .acceleration:
            return accelerationWorks
        case .both:
            return brakingWorks && accelerationWorks
        }
    }
    
    mutating func fix() {
        brakingWorks = true
        accelerationWorks = true
    }
}
