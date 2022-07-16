//
//  ContentView.swift
//  UXSwift
//
//  Created by Kevin McKenney on 7/15/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Some text here")
            Spacer()
            Button(action: <#T##() -> Void#>) {
                Text("Next Screen")
            }
            Spacer()
        }
        .padding(100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
