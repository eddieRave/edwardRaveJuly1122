//
//  ContentView.swift
//  UI
//
//  Created by Kevin McKenney on 7/14/22.
//

import SwiftUI

struct Slide1: View {
    @State var showNextSlide = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Some text here")
                Spacer()
                NavigationLink(destination: { Slide2() }) {
                    Text("Next Screen")
                }
                Spacer()
            }
            .padding(50)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Slide1()
    }
}
