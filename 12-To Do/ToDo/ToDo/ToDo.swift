//
//  ToDo.swift
//  ToDo
//
//  Created by Kevin McKenney on 7/20/22.
//

import Foundation

class ToDo: ObservableObject {
    @Published var list: [String] = []
   
    
    @Published var darkMode = false {
        didSet {
            setDefaults()
        }
    }
    
    private var fileURL: URL? {
        let directory = FileManager.SearchPathDirectory.cachesDirectory
        let folder = FileManager.default.urls(for: directory, in: .userDomainMask)
        guard let url = folder.first?.appendingPathComponent("todo") else { return nil }
        return url
    }
    
    init() {
        restoreDefaults()
        accessFile()
    }
    
    func saveFile() {
        guard let data = try? JSONEncoder().encode(list) else { return }
        guard let fileURL = fileURL else { return }

        try? data.write(to: fileURL, options: .atomicWrite)
    }
    
    func accessFile(){
        guard let fileURL = fileURL else { return }
        guard let data = FileManager.default.contents(atPath: fileURL.path) else { return }
        
        if let list = try? JSONDecoder().decode([String].self, from: data) {
            self.list = list
        }
    }
    
    func setDefaults() {
        UserDefaults.standard.set(darkMode, forKey: "darkMode")
    }
    
    func restoreDefaults() {
        darkMode = UserDefaults.standard.bool(forKey: "darkMode")
    }
}
