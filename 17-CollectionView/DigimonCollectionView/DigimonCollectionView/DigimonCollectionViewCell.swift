//
//  DigimonCollectionViewCell.swift
//  DigimonCollectionView
//
//  Created by Spencer Hurd on 7/30/22.
//

import UIKit

class DigimonCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imgLabel: UIImageView!
    @IBOutlet weak var levelLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
