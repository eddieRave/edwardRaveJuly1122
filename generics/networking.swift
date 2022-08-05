//
//  networking.swift
//  generics
//
//  Created by Rave Bizz on 8/3/22.
//

import Foundation



class Network{
    func  getData<Model: Decodable>(url: String, completion: @escaping (Model) -> Void){
        guard let url = URL(string: url) else {
            print("bad url")
            return
        }
        URLSession.shared.dataTask(with: url, completionHandler: {
            data,_, _ in
            guard let data = data else {
                print("no data")
                return
            }
            do {
                let model = try JSONDecoder().decode(Model.self, from: data)
                completion(model)
            } catch  {
                print(error)
            }
        }).resume()
    }
    
    func getArmor(completion: @escaping ([ArmorSet]) -> Void){
        let url = ""
        guard let url = URL(string: url) else {
            print("bad url")
            return
        }
        URLSession.shared.dataTask(with: url, completionHandler: {
            data,_, _ in
            guard let data = data else {
                print("no data")
                return
            }
            do {
                let model = try JSONDecoder().decode([ArmorSet].self, from: data)
                completion(model)
            } catch  {
                print(error)
            }
        }).resume()
    }
    
    
    
    
    
    
    
//
//    func getData<T:Decodable>(url: String, completion: @escaping (T) -> Void){
//        guard let url = URL(string: url) else {
//            print("bad url")
//            return
//        }
//        URLSession.shared.dataTask(with: url, completionHandler: {
//            data,_, _ in
//            guard let data = data else {
//                print("no data")
//                return
//            }
//            do {
//                let model = try JSONDecoder().decode(T.self, from: data)
//                completion(model)
//            } catch  {
//                print(error)
//            }
//        }).resume()
//    }
}
