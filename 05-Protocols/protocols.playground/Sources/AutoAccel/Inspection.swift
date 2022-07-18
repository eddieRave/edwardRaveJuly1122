import Foundation

enum Inspection {
    case acceleration
    case braking
    
    func getInspectionType() -> Inspection {
        
        switch self {
        case .acceleration:
            return .acceleration
        case .braking:
            return .braking
        }
        
    }
    
} // end of enum 
