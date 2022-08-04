//
//  Theme.swift
//  Todo
//
//  Created by Joel Maldonado on 8/3/22.
//

import Foundation
import UIKit

struct Theme {
    let textColor: UIColor
    let backgroundColor: UIColor
    
    static let dark = Theme(textColor: .white, backgroundColor: .black)
    static let light = Theme(textColor: .black, backgroundColor: .white)
}
