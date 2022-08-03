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
    
    var darkMode = false
    
    func getDefaults(){
        
        let defaultMode = UserDefaults.standard.bool(forKey: "darkmode")
        print(defaultMode)
        darkMode = defaultMode
    }
    
    func setDarkMode(){
        
        UserDefaults.standard.set(darkMode, forKey: "darkmode")
    }
    
    func addToDo(for toDo: String) -> Void {
        
        toDos.insert(toDo, at: 0)
        
        // UserDefaults method
        
        UserDefaults.standard.set(toDos, forKey: "toDoList")
        
        print("todoooooo>>>", toDos)
    }
    
}

protocol Addable {
    
    func addToDo(for toDo: String) -> Void
}
