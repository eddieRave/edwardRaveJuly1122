//
//  AccelShop.swift
//  protocolProject
//
//  Created by Luat on 4/29/22.
//

import Foundation

class AccelShop {
    
    var inspections: [Billable] = []
    var repairs: [Billable] = []
    var mechanics: [Mechanic] = []
    var customers: [Customer] = []
    
    private var mechanic: Mechanic? {
        mechanics.first { $0.isAvailable }
    }
    
    private func add(inspection: Billable) {
        inspections.append(inspection)
    }
    
    private func add(repair: Billable) {
        repairs.append(repair)
    }
    
    private func inspectNext() {
        guard let mechanic = mechanic else {
            return
        }

        let inspection = inspections.removeFirst()
        
        if mechanic.inspect(inspection: inspection) {
            notify(name: inspection.customerName)
        } else {
            add(repair: inspection)
        }
    }
    
    private func repairNext() {
        guard let mechanic = mechanic else {
            print("no available mechanic")
            return
        }
        
        let task = repairs.removeFirst()
        
        if mechanic.repair(inspection: task) {
            add(inspection: task)
        } else {
            add(repair: task)
        }
    }
    
    private func workNextTask() -> Bool {
        if inspections.isEmpty == false {
            inspectNext()
        } else if repairs.isEmpty == false {
            repairNext()
        } else {
            return false
        }
        return true
    }
    
    
    private func notify(name: String) {
        print("Customer \(name): Your car is ready")
    }
    
    func receive(vehicles: [Motorized], name: String) {
        vehicles.forEach { vehicle in
            let ticket = Ticket(vehicle: vehicle, categories: [.accel, .braking], customerName: name)
            add(inspection: ticket)
        }
    }
    
    func start() {
        while workNextTask() {
            print("working")
        }
        print("finish")
    }
}
