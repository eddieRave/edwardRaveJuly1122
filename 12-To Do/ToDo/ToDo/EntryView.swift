//
//  EntryView.swift
//  ToDo
//
//  Created by Kevin McKenney on 7/20/22.
//

import SwiftUI

struct EntryView: View {
    @EnvironmentObject var toDo: ToDo
    @Environment(\.presentationMode) var presentationMode
    
    @State var entryText: String = ""
    
    var body: some View {
        VStack {
            Button(action: {
                if entryText != "" {
                    toDo.list.append(entryText)
                    toDo.saveFile()
                    presentationMode.wrappedValue.dismiss()
                }
            }) { Text("Add Item") }
            ZStack {
                RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).foregroundColor(.black)
                TextEditor(text: $entryText).padding(2)
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
