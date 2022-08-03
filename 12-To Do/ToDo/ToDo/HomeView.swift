//
//  HomeView.swift
//  ToDo
//
//  Created by Kevin McKenney on 8/3/22.
//

import SwiftUI



struct HomeView: View {
    @EnvironmentObject var toDo: ToDo
    
    var body: some View {
        TabView {
            ToDoListView().tabItem {
                Label("To Do List", systemImage: "pencil")
            }
            SettingsView().tabItem {
                Label("Settings", systemImage: "gear")
            }
        }
        .preferredColorScheme(toDo.darkMode ? .dark : .light)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
