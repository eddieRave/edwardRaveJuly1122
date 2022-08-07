//
//  ApiManager.swift
//  DigimonCollectionView
//
//  Created by Joel Maldonado on 7/29/22.
//

import UIKit

final class ApiManager {
    static let shared = ApiManager()
    
    let digiUrl = "https://digimon-api.vercel.app/api/digimon"
    
    private init() {}
    
    func fetchData(completion: @escaping ([DigimonModel]) -> Void) {
        guard let url = URL(string: digiUrl) else {
            print("Invalid URL!")
            return
        }
        
        URLSession.shared.dataTask(with: url) {
            data, res, err in
            
            guard let data = data, err == nil else {
                print("No data")
                return
            }
            
            guard let httpResponse = res as? HTTPURLResponse,
                httpResponse.statusCode == 200
            else {
                print("http status code error")
                return
            }
            
            do {
                let digimon = try JSONDecoder().decode([DigimonModel].self, from: data)
                completion(digimon)
            } catch {
                print("Parsing Error")
                print(error)
            }
        }.resume()
    }
}

extension UIImageView {
    func fetchImage(imgStr: String) {
        guard let url = URL(string: imgStr) else {
            print("Invalid Image URL!")
            return
        }
        
        URLSession.shared.dataTask(with: url) {
            data, res, err in
            
            guard let data = data, err == nil else {
                print("Data error")
                return
            }
            
            guard let httpResponse = res as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                print("http status code error")
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }.resume()
    }
}
