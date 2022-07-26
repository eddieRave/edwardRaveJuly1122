//
//  ViewModel.swift
//  mvvm
//
//  Created by Rave Bizz on 5/6/22.
//

import Foundation

class ViewModel {
    var model: Model? {
        didSet {
            // closure updates the view that's reflecting this model
            updateUI()
        }
    }
    
    var modelText: String {
        model?.name ?? "  "
    }
    
    var updateUI: () -> Void = { print("update closure not set yet")}
    
    func getData() {
        URLSession.shared.dataTask(with: URL(string: "https://www.google.com")!) { data, response, error in
            guard let _ = data else { return }
            DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
                self.model = Model(name: "google")
            }
        }.resume()
    }
    
    func changeData() {
        model = Model(name: "amazon")
    }
}
