import Foundation

struct Customer {
    // Properties
    let vehicle: Vehicle
    let inspection: Inspection
    var inspectionState: Bool = false
    
    //-------------------------------------
    // Getter info
    //--------------------------------------
    func getVehicleinfo() {
        print("ID: \(vehicle.getID()), Make and model: \(vehicle.getMake()) \(vehicle.getModel())")
    }
    
    func getVehicle() -> Vehicle {
        return vehicle
    }
    
    func inspectionStatus() -> Bool {
        let status = inspection.getInspectionType()
        
        if status == Inspection.acceleration && inspectionState {
            return true
        } else if status == Inspection.acceleration && !inspectionState {
            return false
        } else if status == Inspection.braking && inspectionState {
            return true
        }
        return false
    }
    
    
}

