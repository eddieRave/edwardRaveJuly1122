//
//  Slide2.swift
//  UI
//
//  Created by Kevin McKenney on 7/14/22.
//

import SwiftUI

struct Slide2: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var showNextSlide = false
    
    var body: some View {
        GeometryReader() { geometry in
            VStack {
                ZStack() {
                    Rectangle()
                        .opacity(0)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                    VStack {
                        Spacer()
                        ZStack {
                            Rectangle()
                                .foregroundColor(.teal)
                                .frame(width: geometry.size.width / 2, height: geometry.size.height / 2)
                            Image(systemName: "star.circle")
                                .foregroundColor(.blue)
                                .font(.system(size: 160))
                        }
                        Spacer()
                        NavigationLink(destination: { Slide3() }) {
                            Text("Next Screen")
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}

struct Slide2_Previews: PreviewProvider {
    static var previews: some View {
        Slide2()
    }
}
