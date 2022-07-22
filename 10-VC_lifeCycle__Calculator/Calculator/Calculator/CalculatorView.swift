//
//  CalculatorView.swift
//  Calculator
//
//  Created by Kevin McKenney on 7/19/22.
//

import SwiftUI

struct CalculatorView: View {
    @ObservedObject var controller: Controller
    
    var body: some View {
        VStack {
            Text(controller.displayText)
            ForEach(0..<5) { row in
                HStack {
                    ForEach(0..<4) { element in
                        let tag = row * 4 + element
                        Button(action: { controller.buttonPressed(tag: tag) }) {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.blue)
                                Text(controller.buttonLabels[row][element])
                                    .foregroundColor(.white)
                            }
                            .frame(width: 40, height: 40)
                        }
                        .tag(tag)
                    }
                }
            }
        }
    }
}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        CalculatorView()
//    }
//}


