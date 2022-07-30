//
//  CollectionViewCell.swift
//  collectionViews
//
//  Created by Rave Bizz on 7/29/22.
//

import UIKit
protocol digimonImageDelegate{
    
}
class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var digimonImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func prepareForReuse() {
        digimonImage.image = nil
    }

}
