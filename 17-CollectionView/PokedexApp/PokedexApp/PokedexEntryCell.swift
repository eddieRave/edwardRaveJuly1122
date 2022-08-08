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
    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(for vm: PokemonViewModel) {
        nameLabel.text = vm.name
        pokemon.image = vm.image
        
        let gradient = vm.getGradient()
        gradient.frame = bgView.bounds
        
        bgView.layer.sublayers?.removeAll()
        bgView.layer.addSublayer(gradient)
        bgView.layer.zPosition = 0
    }
    
    
}
