//
//  CollectionViewCell.swift
//  ViewCollectionDigimon
//
//  Created by Rave Bizz 41 on 7/29/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var digimonImage: UIImageView!
    @IBOutlet weak var digimonName: UILabel!
    @IBOutlet weak var digimonLevel: UILabel!
    
    static let identifier = "CollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: CollectionViewCell.identifier, bundle: nil)
    }
        
}
