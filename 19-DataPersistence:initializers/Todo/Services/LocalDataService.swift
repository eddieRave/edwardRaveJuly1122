//
//  LocalDataService.swift
//  Todo
//
//  Created by Joel Maldonado on 8/3/22.
//

import Foundation

final class LocalDataService {
    static let shared = LocalDataService()
    
    private init() {}
    
    func getTodos(completion: ([Todo]) -> Void) {
        let cacheDirectory = FileManager.SearchPathDirectory.cachesDirectory
        let folderURLs = FileManager.default.urls(for: cacheDirectory, in: .userDomainMask)
        
        guard let fileURL = folderURLs.first?.appendingPathComponent("todos") else { fatalError() }
        
        guard let data = FileManager.default.contents(atPath: fileURL.path) else {
            return
        }
        
        do {
            let todos = try JSONDecoder().decode([Todo].self, from: data)
            completion(todos)
        } catch {
            print("Data Load Parsing Error: ")
            print(error)
        }
    }
    
    func saveTodos(_ todos: [Todo]) {
        let cacheDirectory = FileManager.SearchPathDirectory.cachesDirectory
        let folderURLs = FileManager.default.urls(for: cacheDirectory, in: .userDomainMask)
        print(folderURLs)
        guard let fileURL = folderURLs.first?.appendingPathComponent("todos") else { return }
        guard let data = try? JSONEncoder().encode(todos) else {
            return
        }
        try? data.write(to: fileURL, options: .atomicWrite)
    }
}
