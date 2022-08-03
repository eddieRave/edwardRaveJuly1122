//
//  SuccessorCell.swift
//  PokedexApp
//
//  Created by Kevin McKenney on 8/3/22.
//

import UIKit

class SuccessorCell: UITableViewCell {

    @IBOutlet weak var pokemon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        pokemon.image = UIImage(named: "star")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
