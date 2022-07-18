import Foundation

struct Mechanic {
    // Every customer that comes is added to the inspections array
    var inspections: [Customer] = []
    
    // If a vehicle fails inspection, it is added to the repairs array
    // Once vehicle is repaired it is removed from repairs and added to inspections
    var repairs: [Customer] = []
    
    mutating func addToInspectionQueue(customer: Customer) {
        inspections.append(customer)
        //print("Added: \(customer)")
    }
    
    mutating func removeFromInspectionQueue() {
        for(i,_) in inspections.enumerated() {
            if inspections[i].inspectionState {
                inspections.remove(at: i)
            }
        }
    }
    
    mutating func addToRepairQueue() {
        for (i,_) in inspections.enumerated() {
            if !inspections[i].inspectionStatus()  {
                repairs.append(inspections[i])
                repairIssue()
            }
        }
    }
    
    mutating func repairIssue() {
        for(i,_) in repairs.enumerated() {
            repairs[i].inspectionState = true
            print(repairs[i], "successfully repaired")
            removeFromRepairQueue(customer: repairs[i])
            //addToInspectionQueue(customer: repairs[i])
        }
    }
    
    mutating func removeFromRepairQueue(customer: Customer) {
        repairs.removeLast()
    }
    
}
