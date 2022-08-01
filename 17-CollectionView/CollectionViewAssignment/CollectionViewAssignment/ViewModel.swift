//
//  ViewModel.swift
//  CollectionViewAssignment
//
//  Created by Maher Damouni on 7/30/22.
//

import Foundation
import UIKit

class ViewModel {
    
    init() {}
    
    var dogURLS = [String]()
    var dogPictures = [UIImage]()
    var breeds = [String]()
    
    func getBreeds(completion: @escaping () -> Void) {
        
        APIManager.shared.fetchBreeds { data in
            
            self.breeds = Array(data.message.keys.sorted())

//                        print("TEST>>>>", self.breeds)
            completion()
        }
    }
    
    func getImageURLS(for breed: String, completion: @escaping () -> Void) {
        
        APIManager.shared.fetchURLs(for: breed) { data in
            
            self.dogURLS = data.message
                completion()
        }
//            print("HERE>>>>", self.dogURLS.count)
    }
    
    func getDogImages(completion: @escaping () -> Void) {
//        print("HERE", self.dogURLS.count)
        self.dogPictures = []
        
        for dog in dogURLS {
            
            APIManager.shared.fetchImageData(for: dog) { image in
//                print("test")
                self.dogPictures.append(image)
                completion()
            }
        }
    }
}
