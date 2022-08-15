//
//  ApiManager.swift
//  DigimonCollectionView
//
//  Created by Spencer Hurd on 7/30/22.
//

import Foundation
import UIKit

final class ApiManager {
    
    static let shared = ApiManager()
    private init() {}
    
    func fetchDigimon(completionFD: @escaping ([Digimon]) -> Void ) {
        let url = "https://digimon-api.vercel.app/api/digimon"
        guard let url = URL(string: url) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                print("No data received")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("HTTP status code error")
                return
            }
            do {
                let decodedData = try JSONDecoder().decode([Digimon].self, from: data)
                completionFD(decodedData)
            } catch {
                print("Error decoding Digimon data from JSON")
            }
        })
        task.resume()
    }
}

// Create a network function to call on the UIImageView located in the CollectionViewCell
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
