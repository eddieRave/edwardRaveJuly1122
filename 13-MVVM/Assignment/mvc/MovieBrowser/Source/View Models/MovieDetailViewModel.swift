//
//  MovieDetailViewModel.swift
//  MovieBrowser
//
//  Created by Rave Bizz 63 on 8/3/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailViewModel {

    init()  {}

    var movieTitle: String = "no title"
    var releaseDate: String = "no release date"
    var descriptionText: String = "no description"
    var imgPath: String = ""
    
    
    func formatDate(dateString: String, inFormat: String = "yyyy/MM/dd", outFormat: String) -> String? {
        let dateFormatter = DateFormatter.posixFormatter
        dateFormatter.dateFormat = inFormat
        guard let date = dateFormatter.date(from: dateString) else { return nil }
        dateFormatter.dateFormat = outFormat
        return dateFormatter.string(from: date)
    }
}
