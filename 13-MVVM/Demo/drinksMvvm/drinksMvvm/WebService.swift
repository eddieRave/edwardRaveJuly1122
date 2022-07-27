//
//  WebService.swift
//  drinksMvvm
//
//  Created by Rave Bizz on 5/5/22.
//

import Foundation

let drinksStr = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Gin"

struct Webservice {
    static let shared = Webservice()
    func getDrinks(completion: @escaping ([DrinkModel.Drink]) -> Void) {
        guard let url = URL(string: drinksStr) else {
            print("invalid url")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("no data, networking error")
                return
            }
            
            guard
                let httpResonse = response as? HTTPURLResponse,
                httpResonse.statusCode == 200
            else {
                print("http status code error")
                return
            }
            do {
                let model = try JSONDecoder().decode(DrinkModel.self, from: data)
                completion(model.drinks)
            } catch {
                // decoding error
                print("parsing error")
                print(error)
            }
            
        }.resume()
        
    }
    
    func getImageData(imageUrl: String, completion: @escaping (Data) -> Void) {
        guard let url = URL(string: imageUrl) else {
            print("invalid url")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("no data, networking error")
                return
            }
            
            guard
                let httpResonse = response as? HTTPURLResponse,
                httpResonse.statusCode == 200
            else {
                print("http status code error")
                return
            }
            
            completion(data)

        }.resume()
        
    }
}
