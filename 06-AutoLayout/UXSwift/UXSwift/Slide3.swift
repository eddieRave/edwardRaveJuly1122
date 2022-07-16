//
//  Slide3.swift
//  UXSwift
//
//  Created by Kevin McKenney on 7/15/22.
//

import SwiftUI

struct Slide3: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Some text here   Compress this so there's not enough room")
                .lineLimit(1)
            Text("This label should have multiple lines that can expand based on how long the text is, and should not compress")
            Rectangle()
                .foregroundColor(.yellow)
            NavigationLink(destination: Slide4()) {
                Text("Next Screen")
            }
        }
        .padding(40)
    }
}

struct Slide3_Previews: PreviewProvider {
    static var previews: some View {
        Slide3()
    }
}


