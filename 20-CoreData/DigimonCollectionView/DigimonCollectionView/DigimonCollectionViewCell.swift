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
    var indexPathRow: Int?
    var delegate: AddFavoriteProtocol?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imgLabel: UIImageView!
    @IBOutlet weak var levelLabel: UILabel!
    
    @IBAction func favoriteButton(_ sender: UIButton) {
        favButtonIsActive.toggle()
        guard let indexPathRow = indexPathRow else {
            return
        }
        // Updates boolean local to this cell, adds to favorites array
        if favButtonIsActive == true {
            updateFavoriteIcon(icon: "★", sender: sender)
            delegate?.addIdToFavorites(indexPathRow: indexPathRow)
        } else {
            updateFavoriteIcon(icon: "☆", sender: sender)
            delegate?.removeFromFavories(indexPathRow: indexPathRow)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateFavoriteIcon(icon: String, sender: UIButton) {
        if let attrFont = UIFont(name: "Helvetica", size: 27) {
            let attrTitle = NSAttributedString(string: icon, attributes: [NSAttributedString.Key.font: attrFont])
            sender.setAttributedTitle(attrTitle, for: UIControl.State.normal)
        }
    }

}
