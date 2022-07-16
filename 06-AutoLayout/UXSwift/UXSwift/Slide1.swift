//
//  ContentView.swift
//  UXSwift
//
//  Created by Kevin McKenney on 7/15/22.
//

import SwiftUI

struct Slide1: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Some text here")
                Spacer()
                NavigationLink(destination: Slide2()) {
                    Text("Next Screen")
                }
                Spacer()
            }
            .padding(70)
        }
    }
}

struct Slide1_Previews: PreviewProvider {
    static var previews: some View {
        Slide1()
    }
}
