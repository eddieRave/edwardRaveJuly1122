//
//  Network.swift
//  CollectionViewAssignment
//
//  Created by Maher Damouni on 7/30/22.
//

import Foundation
import UIKit

final class APIManager {
    
    init() {}
    
    static let shared = APIManager()
    
    func fetchBreeds(completion: @escaping (Breed) -> Void) {
        
        let url = "https://dog.ceo/api/breeds/list/all"
        guard let url = URL(string: url) else { return }
        
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            guard let data = data else { return }
            
            do {
                let decodedData = try JSONDecoder().decode(Breed.self, from: data)
                completion(decodedData)
            } catch {
                print("error in breed API call", error)
            }
            
            
        }.resume()
    }
    
    func fetchURLs(for breed: String, completion: @escaping (Dog) -> Void) {
        
        let url = "https://dog.ceo/api/breed/\(breed)/images/random/90"
        guard let url = URL(string: url) else { return }
        
//        print("URL HERE>>>", url)
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            guard let data = data else { return }
            
            do {
                
                let decodedData = try JSONDecoder().decode(Dog.self, from: data)
                completion(decodedData)
            } catch {
                print("error in api call", error)
            }
            
        }.resume()
        
        
    }
    
    func fetchImageData(for url: String, completion: @escaping (UIImage) -> Void) {
        
            guard let url = URL(string: url) else { return }

            URLSession.shared.dataTask(with: url) {data, response, error in
                
                guard let data = data else {
                    print("data")
                    return
                }

                guard let image = UIImage(data: data) else {
                    print("image")
                    return }
                
                completion(image)
                
            }.resume()
        
    }
}
