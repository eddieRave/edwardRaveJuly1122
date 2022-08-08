//
//  Networking.swift
//  Digimon
//
//  Created by Rave Bizz 63 on 8/7/22.
//

import Foundation
import UIKit

final class Networking {
    static let shared = Networking()
    private init(){}
    
    func fetchData (dataCompletion: @escaping ([Digimon]) -> Void) {
        let url = "https://digimon-api.vercel.app/api/digimon"
        guard let url = URL(string: url) else {
            return
        }
        URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                print("No data received")
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("HTTP status code error")
                return
            }
            do {
                let digimonData = try JSONDecoder().decode([Digimon].self, from: data)
                dataCompletion(digimonData)
            } catch {
                print(error)
            }
        }) .resume()
    }
}

extension UIImageView {
    func fetchImage(for urlString: String) {
        guard let url = URL(string: urlString) else {
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
