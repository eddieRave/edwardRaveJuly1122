//
//  PokemonDetail.swift
//  PokedexApp
//
//  Created by Kevin McKenney on 7/30/22.
//

import UIKit

class PokemonDetail: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pokemon: UIImageView!
    @IBOutlet weak var abilitiesLabel: UILabel!
    
    var vm: PokemonViewModel? {
        didSet {
            guard let vm = vm else { return }
            self.nameLabel.text = vm.name
            self.pokemon.image = UIImage(data: vm.imageData ?? Data())
            self.abilitiesLabel.text = vm.getAbilities()
        }
    }
    
}
