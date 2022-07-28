//
//  MovieDetailViewModel.swift
//  MovieBrowser
//
//  Created by Spencer Hurd on 7/26/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation

class MovieDetailViewModel {
    
    var imgPath: String = ""
    
    #warning("FIXME: ")
    // Create a function to fetch images
    func getPoster() {
        Network.shared.getImage(imageUrl: imgPath) { image in
            DispatchQueue.main.async {
                self.movieImg.image = image
            }
        }
    }
    
}
