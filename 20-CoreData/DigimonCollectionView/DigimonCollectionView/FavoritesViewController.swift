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
        
        // reload the CollectionView after fetching data
        digimonVM.update = { [unowned self] in
            DispatchQueue.main.async {
                self.favoritesCollectionView.reloadData()
                print("data reloaded")
            }
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
        print("cell created")
        if (digimonVM.favoritesIdArray.contains(indexPath.row)) {
            cell.nameLabel.text = digimonVM.getName(for: indexPath.row)
            if let url = digimonVM.getImage(for: indexPath.row) {
                cell.imgLabel.fetchImage(for: url)
            }
            cell.levelLabel.text = digimonVM.getLevel(for: indexPath.row)
            print("name of digimon: \(digimonVM.getName(for: indexPath.row))")
        }
        return cell
    }
}
