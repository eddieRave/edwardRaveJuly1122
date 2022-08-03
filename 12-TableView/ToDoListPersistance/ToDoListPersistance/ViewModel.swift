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
    
    func getDefaultsForDarkMode(){
        
        let defaultMode = UserDefaults.standard.bool(forKey: "darkmode")
        print(defaultMode)
        darkMode = defaultMode
    }
    
    func setDarkMode(){
        
        UserDefaults.standard.set(darkMode, forKey: "darkmode")
    }
    
    func getToDos() {
        let cacheDirectory = FileManager.SearchPathDirectory.cachesDirectory
        let folderURLs = FileManager.default.urls(for: cacheDirectory, in: .userDomainMask)
        guard let fileURL = folderURLs.first?.appendingPathComponent("todos") else { fatalError() }
        
        guard let data = FileManager.default.contents(atPath: fileURL.path) else {
            fatalError()
        }
        print("DATA>>>>", data)
        if let updatedTodos = try? JSONDecoder().decode([String].self, from: data) {
            
            toDos = updatedTodos
        }
    }
    
    func addToDo(for toDo: String) -> Void {
        
        toDos.insert(toDo, at: 0)
        
//        let car = Car(numWheels: 4, name: "ford")
        let cacheDirectory = FileManager.SearchPathDirectory.cachesDirectory
        let folderURLs = FileManager.default.urls(for: cacheDirectory, in: .userDomainMask)

        guard let fileURL = folderURLs.first?.appendingPathComponent("todos") else { return }
//        guard let fileURL = folderURLs.
        print(folderURLs)
        guard let data = try? JSONEncoder().encode(toDos) else { return }
//
        try? data.write(to: fileURL, options: .atomicWrite)
//
//
//        print("todoooooo>>>", fileURL)
    }
    
    func generateToDo() {
        
        APIManager.shared.fetchToDo { toDo in
            
            
            
        }
    }
    
}

protocol Addable {
    
    func addToDo(for toDo: String) -> Void
    
    func generateToDo() -> Void
}
