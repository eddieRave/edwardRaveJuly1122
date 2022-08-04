//
//  DigimonCollectionViewCell.swift
//  DigimonCollectionView
//
//  Created by Spencer Hurd on 7/30/22.
//

import UIKit

class DigimonCollectionViewCell: UICollectionViewCell {
    
    // Flag to track if Digimon is favorite
    var favButtonIsActive: Bool = false
    
    // variables needed to reference indexPath and ViewModel
    var digimonIndex: Int?
    var delegate: AddFavoriteProtocol?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imgLabel: UIImageView!
    @IBOutlet weak var levelLabel: UILabel!
    
    @IBAction func favoriteButton(_ sender: UIButton) {
        favButtonIsActive.toggle()
        if favButtonIsActive == true {
            if let attrFont = UIFont(name: "Helvetica", size: 27) {
                let attrTitle = NSAttributedString(string: "★", attributes: [NSAttributedString.Key.font: attrFont])
                sender.setAttributedTitle(attrTitle, for: UIControl.State.normal)
            }
            delegate?.addToFavorites(digimonIndexPath: digimonIndex ?? 0)
        } else {
            if let attrFont = UIFont(name: "Helvetica", size: 27) {
                let attrTitle = NSAttributedString(string: "☆", attributes: [NSAttributedString.Key.font: attrFont])
                sender.setAttributedTitle(attrTitle, for: UIControl.State.normal)
            }
            delegate?.removeFromFavorites(digimonIndexPath: digimonIndex ?? 0)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
