//
//  LectureApp.swift
//  Lecture
//
//  Created by Kevin McKenney on 8/13/22.
//

import SwiftUI


@main
struct LectureApp: App {
    
    @StateObject var pokedex = Pokedex()
    
    var body: some Scene {
        WindowGroup {
            PokedexView().environmentObject(pokedex)
        }
    }
}
