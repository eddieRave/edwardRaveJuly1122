//
//  Pokedex.swift
//  PokedexApp
//
//  Created by Kevin McKenney on 7/29/22.
//

import UIKit

class Pokedex: UIViewController {
    
    var vm = PokedexViewModel()

    @IBOutlet weak var pokedex: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurePokedex()
        
        vm.loadPokemonData {
            self.vm.loadPokemonImage(for: $0) {
                DispatchQueue.main.async {
                    self.pokedex.reloadData()
                }
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
        
        pokedex.register(nib, forCellWithReuseIdentifier: "PokedexEntry")
        pokedex.collectionViewLayout = layout
        pokedex.dataSource = self
    }
}

extension Pokedex: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        vm.pokemonCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cellVM = vm.getEntry(at: indexPath.row + vm.startID)else { return UICollectionViewCell() }
        guard let entry = pokedex.dequeueReusableCell(withReuseIdentifier: "PokedexEntry", for: indexPath) as? PokedexEntryCell else { return UICollectionViewCell() }
        entry.configure(for: cellVM)
        return entry
    }
    
    
}

//extension Pokedex: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let storyBoard: UIStoryboard = UIStoryboard(name: "PokemonDetail", bundle: nil)
//        
//        guard let detailVC = storyBoard.instantiateViewController(withIdentifier: "PokemonDetail") as? PokemonDetailViewController else { return }
//        
//        let detailVM = searchViewModel.getDetailVM(indexPath)
//        nextViewController.configure(vm: detailVM)
//        navigationController?.show(nextViewController, sender: nil)
//    }
//}
