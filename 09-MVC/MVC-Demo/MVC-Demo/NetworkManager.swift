//
//  NetworkManager.swift
//  MVC-Demo
//
//  Created by Rave Bizz on 7/18/22.
//

import Foundation

class NetworkManager{
    static let shared = NetworkManager()
    private init(){}
    
    func getData(completion: @escaping (Activity)-> Void){
        guard let url = URL(string: "http://www.boredapi.com/api/activity/") else{
            return
        }
        URLSession.shared.dataTask(with: url, completionHandler: {
            data,_,error in
            if let data = data {
                do {
                    let model  =  try JSONDecoder().decode(Activity.self, from: data)
                    completion(model)
                } catch  {
                    print(error)
                }
            }
        }).resume()
    }
}
