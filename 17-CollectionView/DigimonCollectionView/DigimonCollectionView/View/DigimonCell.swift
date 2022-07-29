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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(digimon: Digimon?) {
        guard let digimon = digimon else {
            return
        }
        
        nameLabel.text = digimon.name
        levelLabel.text = "Level: \(digimon.level)"
        imageView.fetchImage(imgStr: digimon.img)
    }

}
