//
//  FavoritesViewController.swift
//  DigimonCollectionView
//
//  Created by Spencer Hurd on 8/4/22.
//

import UIKit

class FavoritesViewController: UIViewController {

    @IBOutlet weak var favoritesCollectionView: UICollectionView!
    
//    var delegate2: AddFavoriteProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // register cell & connect with CollectionView
        let nib = UINib(nibName: "FavoritesCollectionViewCell", bundle: nil)
        favoritesCollectionView.register(nib, forCellWithReuseIdentifier: "cell")
        
        // connect extension functions with CollectionView
        favoritesCollectionView.dataSource = self
        
        // horizontal scroll
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        // size of cells
        layout.itemSize = .init(width: 300, height: 300)
        
        // spacing between cells
        layout.minimumLineSpacing = 25
        
        // connect layout
        favoritesCollectionView.collectionViewLayout = layout
        
        // fetch Digimon data
        digimonVM.getDigimonData()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        // fetch Digimon data
        digimonVM.getDigimonData()
        DispatchQueue.main.async {
            self.favoritesCollectionView.reloadData()
        }
    }

}

extension FavoritesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        digimonVM.getFavoritesIdArrayCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = favoritesCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? FavoritesCollectionViewCell else {
            return UICollectionViewCell()
        }
        print("FAV-VC-CellAtItem: cell created")
        cell.nameLabel.text = digimonVM.getName(for: digimonVM.favoritesIdArray[indexPath.row])
        if let url = digimonVM.getImage(for: digimonVM.favoritesIdArray[indexPath.row]) {
            cell.imgLabel.fetchImage(for: url)
        }
        cell.levelLabel.text = digimonVM.getLevel(for: digimonVM.favoritesIdArray[indexPath.row])
        print("FAV-VC-CellAtItem: name of digimon: \(digimonVM.getName(for: digimonVM.favoritesIdArray[indexPath.row]) ?? "")")
        return cell
    }
    
}
