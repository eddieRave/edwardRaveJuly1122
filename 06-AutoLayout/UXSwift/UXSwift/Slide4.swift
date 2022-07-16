//
//  Slide4.swift
//  UXSwift
//
//  Created by Kevin McKenney on 7/15/22.
//

import SwiftUI

struct Slide4: View {
    
    @State var showMid = true
    
    var body: some View {
        HStack(spacing: 20) {
            addBG(.purple, to: "Left")
            if showMid {
                Button(action: { showMid = false }) {
                    addBG(.blue, to: "Mid")
                }
            }
            addBG(.yellow, to: "Right")
        }
        .padding(20)
        .font(.system(size: 20))
        .frame(height: 80)
    }
    
    func addBG(_ color: Color, to text: String) -> some View {
        ZStack {
            Rectangle()
                .foregroundColor(color)
                .opacity(0.25)
            Text(text)
                .foregroundColor(.blue)
        }
    }
}

struct Slide4_Previews: PreviewProvider {
    static var previews: some View {
        Slide4()
    }
}
