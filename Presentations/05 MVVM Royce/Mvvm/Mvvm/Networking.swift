//
//  Networking.swift
//  Assessment2
//
//  Created by WillC on 8/15/22.
//

import Foundation

let urlStr = "https://last-airbender-api.herokuapp.com/api/v1/characters"

struct Networking {
    static let shared = Networking()
    func getAvatars<GenericModel: Decodable>(completion: @escaping ([GenericModel]) -> Void) {
        
        guard let url = URL(string: urlStr) else {
            print("invalid url")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                print("no data, networking error")
                return
            }
            do {
                let model = try JSONDecoder().decode([GenericModel].self, from: data)
                completion(model)
            } catch {
                print("parsing error")
                print(error)
            }
            
        }.resume()
    }
    
    func getImageData(imageUrl: String, completion: @escaping (Data) -> Void) {
        
        guard let url = URL( string: imageUrl ) else {
            print( "invalid url" )
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("no data, networking error")
                return
            }
            completion(data)
        }.resume()
        
    }
}
