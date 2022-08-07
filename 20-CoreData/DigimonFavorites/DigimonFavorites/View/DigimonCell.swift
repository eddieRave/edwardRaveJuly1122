//
//  DigimonCell.swift
//  DigimonCollectionView
//
//  Created by Joel Maldonado on 7/29/22.
//

import UIKit

class DigimonCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var digiCellViewModel: DigiCellViewModel? {
        didSet {
            DispatchQueue.main.async {
                self.nameLabel.text = self.digiCellViewModel?.name ?? ""
                self.levelLabel.text = self.digiCellViewModel?.level ?? ""
                self.favoriteButton.imageView?.image = (self.digiCellViewModel?.isFavorite ?? true) ? UIImage(systemName: "star.square.fill") : UIImage(systemName: "star.square")
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func favoritesButtonTapped(_ sender: Any) {
        digiCellViewModel?.toggleFavorite(index: tag)
    }
    
    func configure(vm: DigiCellViewModel) {
        digiCellViewModel = vm
        imageView.fetchImage(imgStr: vm.imgStr)
    }

}
