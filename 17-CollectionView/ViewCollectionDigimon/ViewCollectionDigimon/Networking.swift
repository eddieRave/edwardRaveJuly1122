//
//  Networking.swift
//  ViewCollectionDigimon
//
//  Created by Rave Bizz 41 on 7/29/22.
//

import Foundation
import UIKit

final class APIManager{
    private init(){}
    static let shared = APIManager()
    
    // Make an API Call
    func fetchData(completion: @escaping ([Digimon]) -> Void) {
        let urlStr = "https://digimon-api.vercel.app/api/digimon"
        guard let url = URL(string: urlStr) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url, completionHandler: {
            data, response, error in
            guard let data = data else {
                return
            }

            do {
                let decodedData =  try JSONDecoder().decode([Digimon].self, from:data )
                completion(decodedData)
            } catch  {
                print("error")
            }
        })
        
        task.resume()
    }
    
}

extension UIImageView {
    func fetchImage(for urlStr: String) {
        guard let url = URL(string: urlStr) else {
            return
        }
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            if let data = data {
                DispatchQueue.main.async{
                    self.image = UIImage(data: data)
                }
            }
        }).resume()
    }
}
