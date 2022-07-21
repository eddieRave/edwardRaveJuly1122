//
//  ToDoListView.swift
//  ToDo
//
//  Created by Kevin McKenney on 7/20/22.
//

import SwiftUI

struct ToDoListView: View {
    @EnvironmentObject var toDo: ToDo
 
    
    var body: some View {
        NavigationView {
            List {
                ForEach(toDo.list.indices, id: \.self) { index in
                    HStack {
                        Text(toDo.list[index])
                        Spacer()
                        Button(action: { toDo.list.remove(at: index) }) {
                            Label("", systemImage: "minus.circle")
                        }
                    }
                }
            }.toolbar {
                ToolbarItem {
                    NavigationLink(destination: EntryView()) {
                        Label("", systemImage: "plus")
                    }
                }
            }.navigationTitle(
                "To Do List"
            )
        }.navigationViewStyle(.stack)
    }
}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ToDoListView()
//    }
//}
