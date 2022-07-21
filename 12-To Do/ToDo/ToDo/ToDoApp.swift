//
//  ToDoApp.swift
//  ToDo
//
//  Created by Kevin McKenney on 7/20/22.
//

import SwiftUI

@main
struct ToDoApp: App {
    @ObservedObject var toDo = ToDo()
    
    var body: some Scene {
        WindowGroup {
            ToDoListView().environmentObject(toDo)
        }
    }
}
