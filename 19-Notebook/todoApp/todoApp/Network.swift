//
//  Network.swift
//  todoApp
//
//  Created by WillC on 8/3/22.
//

import Foundation
func decodeAPI(completionHandler: @escaping (String) -> Void) {
    guard let url = URL(string: "http://numbersapi.com/random/year?json") else {
        return
    }
    let task = URLSession.shared.dataTask(with: url){
        data, response, error in
        
        let decoder = JSONDecoder()

        if let data = data{
            do{
                let tasks = try decoder.decode(NumberApi.self, from: data)
                completionHandler(tasks.text)
            } catch {
                print(error)
            }
        }
    }
    task.resume()
}
