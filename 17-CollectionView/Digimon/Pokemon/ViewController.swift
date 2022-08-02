//
//  ViewController.swift
//  PokemonViewModel
//
//  Created by Kevin McKenney on 7/29/22.
//

import UIKit

class ViewController: UIViewController {
    var vm = PokemonViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        vm.getPokemon {
            print("test")
        }
    }


}

