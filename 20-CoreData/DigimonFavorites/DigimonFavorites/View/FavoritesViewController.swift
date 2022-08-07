//
//  FavoritesViewController.swift
//  DigimonFavorites
//
//  Created by Joel Maldonado on 8/6/22.
//

import UIKit

class FavoritesViewController: UIViewController {

    @IBOutlet weak var favoritesCollection: UICollectionView!
    
    let favoritesViewModel = FavoritesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureCollection()
        favoritesViewModel.onChange = { [weak self] in
            self?.updateTable()
        }
        favoritesViewModel.getDigimon()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        favoritesViewModel.getDigimon()
    }
    
    func configureCollection() {
        let nib = UINib(nibName: "DigimonCell", bundle: nil)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: 200, height: 240)
        
        favoritesCollection.register(nib, forCellWithReuseIdentifier: "digiCell")
        favoritesCollection.collectionViewLayout = layout
        favoritesCollection.dataSource = self
    }
    
    func updateTable() {
        DispatchQueue.main.async {
            self.favoritesCollection.reloadData()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FavoritesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        favoritesViewModel.numDigimon
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = favoritesCollection.dequeueReusableCell(withReuseIdentifier: "digiCell", for: indexPath) as? DigimonCell else {
            return UICollectionViewCell()
        }
        
        let tempVM = favoritesViewModel.getDigiCellVM(at: indexPath.row)
        tempVM.removeFavorite = { [weak self] index in
            self?.favoritesViewModel.removeCellVM(at: index)
        }
        cell.configure(vm: tempVM)
        cell.tag = indexPath.row
        return cell
    }
    
    
}
