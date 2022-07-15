//
//  Slide3.swift
//  UI
//
//  Created by Kevin McKenney on 7/14/22.
//

import SwiftUI

struct Slide3: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Some text here    Compress this so there's not enough room")
                .lineLimit(1)
            Text("This able should have multiple lines that can expand based on how long the text is, and should not compress")
            Rectangle()
                .foregroundColor(.yellow)
            NavigationLink(destination: { Slide4() }) {
                Text("Next Screen")
            }
        }
    }
}

struct Slide3_Previews: PreviewProvider {
    static var previews: some View {
        Slide3()
    }
}
