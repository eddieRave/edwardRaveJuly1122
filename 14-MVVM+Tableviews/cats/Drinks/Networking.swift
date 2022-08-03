//
//  Networking.swift
//  Drinks
//
//  Created by Rave Bizz on 7/27/22.
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


final class ApiManger{
    private init(){}
    static let shared = ApiManger()
    
    
    func fetchData(completion: @escaping ([Cats])->Void){
        let url = "https://api.thecatapi.com/v1/images/search?limit=50"
        guard let url = URL(string: url) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url, completionHandler: {
            data, response, error in
            guard let data = data else {
                return
            }

            do {
                let decodedData =  try JSONDecoder().decode([Cats].self, from:data )
                completion(decodedData)
            } catch  {
                print("error")
            }
        })
        
        task.resume()
    }
    

}
