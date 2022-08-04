//
//  DigimonCollectionViewCell.swift
//  DigimonCollectionView
//
//  Created by Spencer Hurd on 7/30/22.
//

import UIKit

class DigimonCollectionViewCell: UICollectionViewCell {
    
    var favButtonIsActive: Bool = false
    
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
        } else {
            if let attrFont = UIFont(name: "Helvetica", size: 27) {
                let attrTitle = NSAttributedString(string: "☆", attributes: [NSAttributedString.Key.font: attrFont])
                sender.setAttributedTitle(attrTitle, for: UIControl.State.normal)
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
