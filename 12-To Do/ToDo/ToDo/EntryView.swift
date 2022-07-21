//
//  EntryView.swift
//  ToDo
//
//  Created by Kevin McKenney on 7/20/22.
//

import SwiftUI

struct EntryView: View {
    @EnvironmentObject var toDo: ToDo
    @State var entryText: String = ""
    
    var body: some View {
        VStack {
            TextField("Enter Item", text: $entryText)
            Spacer()
            Button(action: {
                if entryText != "" {
                    toDo.list.append(entryText)
                }
            }) {
                Text("Add Item")
            }
            Spacer()
        }
    }
}

//struct EntryView_Previews: PreviewProvider {
//    static var previews: some View {
//        EntryView()
//    }
//}
