//
//  CalculatorApp.swift
//  Calculator
//
//  Created by Kevin McKenney on 7/19/22.
//

import SwiftUI

@main
struct CalculatorApp: App {
    
    @StateObject var controller = Controller()
    
    var body: some Scene {
        WindowGroup {
            CalculatorView(controller: controller)
        }
    }
}
