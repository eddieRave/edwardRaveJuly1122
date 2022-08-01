//
//  CollectionViewCell.swift
//  PokedexApp
//
//  Created by Kevin McKenney on 7/29/22.
//

import UIKit

class PokedexEntryCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var pokemon: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(for vm: PokemonViewModel) {
        nameLabel.text = vm.name
        pokemon.image = UIImage(data: vm.imageData ?? Data()) ?? UIImage()
    }
    
}
