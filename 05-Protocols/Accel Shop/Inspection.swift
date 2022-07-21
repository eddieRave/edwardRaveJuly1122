//
//  Inspection.swift
//  Accel Shop
//
//  Created by Joel Maldonado on 7/14/22.
//

import Foundation

enum InspectionType {
    case Acceleration
    case Braking
}

struct Inspection: Equatable {
    static func == (lhs: Inspection, rhs: Inspection) -> Bool {
        lhs.type == rhs.type
    }
    
    let type: InspectionType
    var checksOut: Bool = Int.random(in: 0 ... 1) == 1
    
    mutating func setChecksOut(_ status: Bool) {
        self.checksOut = status
    }
}
