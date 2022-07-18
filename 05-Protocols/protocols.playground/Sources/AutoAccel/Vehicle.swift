import Foundation

struct Vehicle {
    let id: Int
    let make: String
    let model: String
    
    
    //---------------------------------------
    // Getter functions
    //---------------------------------------
    func getID() -> Int {
        return self.id
    }
    
    func getMake() -> String {
        return self.make
    }
    
    func getModel() -> String {
        return self.model
    }
    
}
