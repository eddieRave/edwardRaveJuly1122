//
//  NetworkManger.swift
//  TableView
//
//  Created by Rave Bizz on 7/20/22.
//

import Foundation


class NetworkManager{
    static let shared = NetworkManager()
    func FetchData(completion: @escaping ([Mod])->Void){
        guard let url = URL(string: "https://ghibliapi.herokuapp.com/people") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url, completionHandler: {
            data,_,e in
            if let data = data {
                do {
                    let  model = try JSONDecoder().decode([Mod].self, from: data)
                    completion(model)
                } catch  {
                    print("error")
                }
            }
        })
        task.resume()
        
    }
}
