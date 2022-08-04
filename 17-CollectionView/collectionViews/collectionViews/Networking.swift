//
//  Networking.swift
//  collectionViews
//
//  Created by WillC on 7/29/22.
//

import Foundation
import UIKit
extension UIImageView{
    func fetchImage(for url: String){
        guard let url = URL(string: url) else{
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: {
            data,_ ,_ in
            
            if let data = data {
                DispatchQueue.main.async{
                    self.image = UIImage(data: data)
                }
            }
        }).resume()
    }
}
class NetworkManager{
    static let shared = NetworkManager()
    func FetchData(completion: @escaping ([DigimonInfo])->Void){
        guard let url = URL(string: "https://digimon-api.vercel.app/api/digimon") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url, completionHandler: {
            data,_,e in
            if let data = data {
                do {
                    let  model = try JSONDecoder().decode([DigimonInfo].self, from: data)
                    completion(model)
                } catch  {
                    print("error")
                }
            }
        })
        task.resume()
        
    }
}
