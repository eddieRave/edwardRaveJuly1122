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
    
    var viewModel: MovieViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieImg.image = UIImage(named: "placeholder")
        configure()
    }
    
    func configure() {
        guard let viewModel = viewModel else { return }
        guard let date = formatDate(dateString: viewModel.date, outFormat: "M/d/yy") else { return }
        movieTitleLabel.text = viewModel.movieTitle
        releaseDateLabel.text = "Release Date: \(date)"
        descriptionLabel.text = viewModel.overview
        bindImage()
        viewModel.fetchImage()
    }
    
    
    func formatDate(dateString: String, inFormat: String = "yyyy/MM/dd", outFormat: String) -> String? {
        let dateFormatter = DateFormatter.posixFormatter
        dateFormatter.dateFormat = inFormat
        guard let date = dateFormatter.date(from: dateString) else { return nil }
        dateFormatter.dateFormat = outFormat
        return dateFormatter.string(from: date)
    }
    
    func bindImage() {
        guard let viewModel = viewModel else { return }
        viewModel.updateImg = {
            guard let imageData = viewModel.imgData else {
                return
            }
            DispatchQueue.main.async {
                self.movieImg.image = UIImage(data: imageData)
            }
        }
    }
}


