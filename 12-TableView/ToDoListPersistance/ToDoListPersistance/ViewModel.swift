//
//  ViewModel.swift
//  ToDoListPersistance
//
//  Created by Maher Damouni on 8/3/22.
//

import Foundation

class ViewModel: Addable {
    
    var update: () -> Void = {}
    
    var toDos = ["get groceries", "get swole"] {
        didSet {
            update()
        }
    }
    
    func addToDo(for toDo: String) -> Void {
        
        toDos.insert(toDo, at: 0)
        print("todoooooo>>>", toDos)
    }
}

protocol Addable {
    
    func addToDo(for toDo: String) -> Void
}
