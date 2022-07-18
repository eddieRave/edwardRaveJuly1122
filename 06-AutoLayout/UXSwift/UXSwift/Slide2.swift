//
//  Slide2.swift
//  UXSwift
//
//  Created by Kevin McKenney on 7/15/22.
//

import SwiftUI

struct Slide2: View {
    var body: some View {
        GeometryReader() { geometry in
            HStack {
                Spacer()
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
                    NavigationLink(destination: Slide3()) {
                        Text("Next Screen")
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct Slide2_Previews: PreviewProvider {
    static var previews: some View {
        Slide2()
    }
}
