//
//  DigimonCollectionViewCell.swift
//  Digimon
//
//  Created by Rave Bizz 63 on 8/7/22.
//

import UIKit

class DigimonCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var digimonNameLabel: UILabel!
    @IBOutlet weak var digimonLevelLabel: UILabel!
    @IBOutlet weak var digimonImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}