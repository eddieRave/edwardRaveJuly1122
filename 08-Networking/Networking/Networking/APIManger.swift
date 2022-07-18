//
//  APIManger.swift
//  Networking
//
//  Created by Rave Bizz on 7/18/22.
//

import Foundation

class APIManager{
    static let shared = APIManager()
    private init(){}
    
    let url = "https://api.jokes.one/jod"
    
    func fetchData(completion: @escaping (JokeModel) -> Void){
        guard let url = URL(string: url) else{
            return
        }
        URLSession.shared.dataTask(with: url){
            data, response, error in
            if let data = data {
                do {
                    let decodedData  = try JSONDecoder().decode(JokeModel.self, from: data)
                    completion(decodedData)
                } catch  {
                    print(error)
                }
            }
        }.resume()
        print("line 31")
    }
}
