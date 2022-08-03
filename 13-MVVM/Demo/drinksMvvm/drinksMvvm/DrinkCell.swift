//
//  DrinkCell.swift
//  drinksMvvm
//
//  Created by Rave Bizz on 5/5/22.
//

import UIKit

class DrinkCell: UITableViewCell {

    static let identifier = String(describing: DrinkCell.self)
    
    @IBOutlet weak var drinkImageView: UIImageView!
    @IBOutlet weak var drinkNameLabel: UILabel!
    
    var drinkCellViewModel: DrinkCellViewModel? {
        didSet {
            DispatchQueue.main.async {
                self.drinkNameLabel.text = self.drinkCellViewModel?.drinkName ?? "No Name"
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        drinkImageView.image = nil
    }
    
    func configure(vm: DrinkCellViewModel) {
        self.drinkCellViewModel = vm
        bindImage()
        vm.fetchImage()
    }
    
    func bindImage() {
        drinkCellViewModel?.updateImage = {
            guard let imageData = self.drinkCellViewModel?.imageData else {
                return
            }
            DispatchQueue.main.async {
                self.drinkImageView.image = UIImage(data: imageData)
            }
        }
    }
}
