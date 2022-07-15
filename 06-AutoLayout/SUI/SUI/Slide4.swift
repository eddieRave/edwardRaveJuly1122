//
//  Slide4.swift
//  UI
//
//  Created by Kevin McKenney on 7/14/22.
//

import SwiftUI

struct Slide4: View {
    
    @State var showMid = true
    
    var body: some View {
        HStack(spacing: 20) {
            ZStack {
                Rectangle()
                    .foregroundColor(.pink)
                    .opacity(0.25)
                Text("Left")
                    .foregroundColor(.blue)
            }
            if showMid {
                Button(action: { showMid = false }) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.blue)
                            .opacity(0.25)
                        Text("Mid")
                    }
                }
            }
            ZStack {
                Rectangle()
                    .foregroundColor(.yellow)
                    .opacity(0.25)
                Text("Right")
                    .foregroundColor(.blue)
            }
        }
        .frame(height: 40)
        .padding(.horizontal, 20)
        .padding(.bottom, 100)
        .font(.system(size: 20))
    }
}

struct Slide4_Previews: PreviewProvider {
    static var previews: some View {
        Slide4()
    }
}
