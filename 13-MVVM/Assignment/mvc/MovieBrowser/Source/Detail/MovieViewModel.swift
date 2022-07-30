//
//  MovieViewModel.swift
//  MovieBrowser
//
//  Created by Maher Damouni on 7/30/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation
import UIKit

class MovieViewModel {
    
    init()  {}
    
    var movieTitle: String = "no title"
    var releaseDate: String = "no release date"
    var descriptionText: String = "no description"
    var imgPath: String = ""
    
    
    func getImageData(completion: @escaping (UIImage) -> Void) {
        var currentImage = UIImage()
        Network().getImage(imageUrl: imgPath) { image in
            guard let image = image else { return }
            currentImage = image
        }
        completion(currentImage)
    }
    
    func formatDate(dateString: String, inFormat: String = "yyyy/MM/dd", outFormat: String) -> String? {
        let dateFormatter = DateFormatter.posixFormatter
        dateFormatter.dateFormat = inFormat
        guard let date = dateFormatter.date(from: dateString) else { return nil }
        dateFormatter.dateFormat = outFormat
        return dateFormatter.string(from: date)
    }
}
