//
//  Mechanic.swift
//  protocolProject
//
//  Created by Luat on 8/9/21.
//

import Foundation

protocol MechanicProtocol {
    var isAvailable: Bool { get }
    
    func inspect(inspection: Billable) -> Bool
    func repair(inspection: Billable) -> Bool
}

class Mechanic {
    private var random: Int {
        Int.random(in: 0...9)
    }
    var isAvailable: Bool = true
    
    private func stayBusy(for hours: Int) {
        DispatchQueue.global().asyncAfter(deadline: .now() + Double(hours)) {
            self.isAvailable = true
        }
    }
    
    func inspect(inspection: Billable) -> Bool {
        inspection.categories.forEach { category in
            print("inspecting \(inspection.vehicle.model): \(category.rawValue)")
            ///
        }
        return random % 2 == 0
    }
    
    func repair(inspection: Billable) -> Bool {
        inspection.categories.forEach { category in
            print("repairing \(inspection.vehicle.model): \(category.rawValue)")
            /// require equipment to repair
        }
        return random % 2 == 0
    }
}
