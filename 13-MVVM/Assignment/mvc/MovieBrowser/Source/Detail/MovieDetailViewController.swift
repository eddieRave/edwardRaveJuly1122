//
//  MovieDetailViewController.swift
//  SampleApp
//
//  Created by Struzinski, Mark on 2/26/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    @IBOutlet weak var movieImg: UIImageView!
    
//    var movieTitle: String = "no title"    // MVC
//    var releaseDate: String = "no release date"    // MVC
//    var descriptionText: String = "no description"    // MVC
//    var imgPath: String = ""    // MVC
    
    var movieDetailVM = MovieDetailViewModel()   // MVVM
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieImg.image = UIImage(named: "placeholder")
        configure()
    }
    
    func configure() {
//        guard let date = formatDate(dateString: self.releaseDate, outFormat: "M/d/yy") else { return }      // MVC
        guard let date = formatDate(dateString: self.movieDetailVM.releaseDate, outFormat: "M/d/yy") else { return } // MVVM
//        movieTitleLabel.text = self.movieTitle      // MVC
        movieTitleLabel.text = self.movieDetailVM.movieTitle    // MVVM
        releaseDateLabel.text = "Release Date: \(date)"
//        descriptionLabel.text = self.descriptionText      // MVC
        descriptionLabel.text = self.movieDetailVM.descriptionText      // MVVM
//        getPoster()     // MVC
        movieDetailVM.getPoster(completionGP: { data in
            DispatchQueue.main.async {
                self.movieImg.image = UIImage(data: data!)
            }
        })      // MVVM
    }
    
//    func getPoster() {
//       image in
//            DispatchQueue.main.async {
//                self.movieImg.image = image
//            }
//        }
//    }     // MVC
    
    func formatDate(dateString: String, inFormat: String = "yyyy/MM/dd", outFormat: String) -> String? {
        let dateFormatter = DateFormatter.posixFormatter
        dateFormatter.dateFormat = inFormat
        guard let date = dateFormatter.date(from: dateString) else { return nil }
        dateFormatter.dateFormat = outFormat
        return dateFormatter.string(from: date)
    }
}


