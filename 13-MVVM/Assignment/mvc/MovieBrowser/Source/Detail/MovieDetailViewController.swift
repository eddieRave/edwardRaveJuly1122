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
    
    let viewModel = MovieViewModel()
    
//    var movieTitle: String = "no title"
//    var releaseDate: String = "no release date"
//    var descriptionText: String = "no description"
//    var imgPath: String = ""
//
    override func viewDidLoad() {
        super.viewDidLoad()
        movieImg.image = UIImage(named: "placeholder")
        configure()
    }
    
    func configure() {
        guard let date = viewModel.formatDate(dateString: viewModel.releaseDate, outFormat: "M/d/yy") else { return }
        movieTitleLabel.text = viewModel.movieTitle
        releaseDateLabel.text = "Release Date: \(date)"
        descriptionLabel.text = viewModel.descriptionText
        getPoster()
    }
    
    func getPoster() {
        viewModel.getImageData { image in
            
            DispatchQueue.main.async{
                self.movieImg.image = image
            }
        }
    }
//        Network().getImage(imageUrl: imgPath) { image in
//            DispatchQueue.main.async {
//                self.movieImg.image = image
//            }
//        }
    
//    func formatDate(dateString: String, inFormat: String = "yyyy/MM/dd", outFormat: String) -> String? {
//        let dateFormatter = DateFormatter.posixFormatter
//        dateFormatter.dateFormat = inFormat
//        guard let date = dateFormatter.date(from: dateString) else { return nil }
//        dateFormatter.dateFormat = outFormat
//        return dateFormatter.string(from: date)
//    }
}


