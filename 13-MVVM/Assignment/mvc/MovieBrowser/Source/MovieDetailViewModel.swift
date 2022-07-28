//
//  MovieDetailViewModel.swift
//  MovieBrowser
//
//  Created by Spencer Hurd on 7/26/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation

class MovieDetailViewModel {
    
    var movieTitle: String = "no title"
    var releaseDate: String = "no release date"
    var descriptionText: String = "no description"
    var imgPath: String = ""
    
    // Create a function to fetch images
    func getPoster(completionGP: @escaping (Data?) -> Void) {
        Network.shared.getImage(imageUrl: imgPath, completionGI: { data in
            completionGP(data)
         })
//        Network.shared.getImage(imageUrl: imgPath, completionGI: completionGP)    // simplier way of doing the above
    }
    
}
