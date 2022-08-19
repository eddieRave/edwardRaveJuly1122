//
//  AnimationDemo.swift
//  Lecture
//
//  Created by Kevin McKenney on 8/19/22.
//

import SwiftUI

struct AnimationDemo: View {
    
    @State var side = 25.0
    var colors: [Color] = [.red, .blue, .yellow, .black]
    var colorIndex: Int { (Int(side) % 100) / 25 }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Button(action: {
                    withAnimation(.interpolatingSpring(stiffness: 5, damping: 1).repeatCount(3)) {
                        side += 25
                    }
                }) {
                    Text("click me - animated")
                }
                Button(action: {
                    side += 25
                }) {
                    Text("click me")
                }
                Button(action: {
                    side = 25.0
                }) {
                    Text("reset")
                }
                Rectangle()
                    .frame(width: side, height: side)
                    .foregroundColor(colors[colorIndex])
//                    .animation(.easeInOut, value: side)
                    
            }
        }
        .onAppear {
            
            side = 50
            
        }
    }
}

struct AnimationDemo_Previews: PreviewProvider {
    static var previews: some View {
        AnimationDemo()
    }
}
