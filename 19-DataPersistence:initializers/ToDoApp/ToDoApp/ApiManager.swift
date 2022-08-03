//
//  ApiManager.swift
//  ToDoApp
//
//  Created by Spencer Hurd on 8/3/22.
//

import Foundation

class ApiManager {
    static let shared = ApiManager()
    
    func fetchData(completion: @escaping (Task)->Void) {
        
        guard let url = URL(string: "https://api.chucknorris.io/jokes/random") else {
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            if let data = data {
                print("|||||||| Data is called in URLSession ||||||||||", data)
                do {
                    let  model = try JSONDecoder().decode(Task.self, from: data)
                    completion(model)
                } catch  {
                    print("error")
                }
            }
        })
        task.resume()
        
    }
    
}
