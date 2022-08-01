//
//  Pokedex.swift
//  PokedexApp
//
//  Created by Kevin McKenney on 7/29/22.
//

import UIKit

class Pokedex: UIViewController {
    
    var vm: PokedexViewModel?
    
    @IBOutlet weak var pokedex: UICollectionView!
    @IBOutlet weak var loadScreen: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vm = PokedexViewModel()
        title = "Pokedex"
        
        configurePokedex()
        
        vm?.loadPokemon {
            DispatchQueue.main.async {
                self.loadScreen.removeFromSuperview()
                self.pokedex.reloadData()
            }
        }
    }

    func configurePokedex() {
        let nib = UINib(nibName: "PokedexEntryCell", bundle: nil)
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let width = self.view.frame.width / 3
        layout.itemSize = CGSize(width: width, height: 200)
        
        pokedex.register(nib, forCellWithReuseIdentifier: "PokedexEntryCell")
        pokedex.collectionViewLayout = layout
        pokedex.dataSource = self
        pokedex.delegate = self
    }
}

extension Pokedex: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        vm?.pokemonCount ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let vm = vm else { return UICollectionViewCell() }
        guard let cellVM = vm.getEntry(at: indexPath.row + 1) else { return UICollectionViewCell() }
        guard let entry = pokedex.dequeueReusableCell(
            withReuseIdentifier: "PokedexEntryCell", for: indexPath
        ) as? PokedexEntryCell else { return PokedexEntryCell() }
    
        entry.configure(for: cellVM)
        return entry
    }
}

extension Pokedex: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vm = vm else { return }
        let storyBoard: UIStoryboard = UIStoryboard(name: "PokemonDetail", bundle: nil)
        
        guard let detailVC = storyBoard.instantiateViewController(
            withIdentifier: "PokemonDetail"
        ) as? PokemonDetail else { return }
        let detailVM = vm.getEntry(at: indexPath.row + 1)
        
        detailVC.vm = detailVM
        detailVC.evolvableDelegate = vm
        navigationController?.show(detailVC, sender: nil)
    }
}



