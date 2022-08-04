//
//  CollectionViewCell.swift
//  collectionViews
//
//  Created by Rave Bizz on 7/29/22.
//

import UIKit
protocol digimonDelegate{
    func getName(name:String) -> Void
    func getLevel(level:Int) -> Void
}
class CollectionViewCell: UICollectionViewCell, digimonDelegate {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var digimonImage: UIImageView!
    
    func getName(name: String){
        nameLabel.text = name 
    }
    
    func getLevel(level: Int){
        levelLabel.text =  String(level)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        digimonImage.image = nil
    }
}
