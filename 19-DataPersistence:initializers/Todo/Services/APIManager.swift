//
//  APIManager.swift
//  Todo
//
//  Created by Joel Maldonado on 8/3/22.
//

import Foundation

final class APIManager {
    static let shared = APIManager()
    
    private init() {}
    
    func fetchTodo(completion: @escaping (Todo) -> Void) {
        guard let url = URL(string: "http://www.boredapi.com/api/activity") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Data error")
                return
            }
            
            guard let httpResonse = response as? HTTPURLResponse,
                httpResonse.statusCode == 200 else {
                print("http status code error")
                return
            }
            
            do {
                let todo = try JSONDecoder().decode(Todo.self, from: data)
                completion(todo)
            } catch {
                print("Parsing Error: ")
                print(error)
            }
        }.resume()
    }
}
