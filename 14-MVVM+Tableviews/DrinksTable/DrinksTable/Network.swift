//
//  Network.swift
//  DrinksTable
//
//  Created by Joel Maldonado on 7/27/22.
//

import UIKit

extension UIImageView {
    func getImage(url: String) {
        guard let url = URL(string: url) else {
            print("Invalid Image URL!")
            return
        }
        
        URLSession.shared.dataTask(with: url) {
            data, _, _ in
            
            guard let data = data else {
                print("Data error")
                return
            }
            
            DispatchQueue.main.async {
                print(data)
                self.image = UIImage(data: data)
            }
        }.resume()
    }
}

final class Network {
    static let shared = Network()
    
    let drinksUrl = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Gin"
    
    private init() {}
    
    func getDrinks(completion: @escaping ([Drink]) -> Void) {
        guard let url = URL(string: drinksUrl) else {
            print("Invalid URL!")
            return
        }
        
        URLSession.shared.dataTask(with: url) {
            data, res, err in
            guard let data = data else {
                print("Data error")
                return
            }

            do {
                let drinkModel = try JSONDecoder().decode(DrinkModel.self, from: data)
                completion(drinkModel.drinks)
            } catch {
                if let err = err {
                    print("Parsing Error: \(err)")
                }
            }
        }.resume()
    }
}
