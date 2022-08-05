//
//  FavoritesViewController.swift
//  DigimonCollectionView
//
//  Created by Spencer Hurd on 8/4/22.
//

import UIKit

class FavoritesViewController: UIViewController {

    @IBOutlet weak var favoritesCollectionView: UICollectionView!
    
    var delegate: AddFavoriteProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // register cell & connect with CollectionView
        let nib = UINib(nibName: "DigimonCollectionViewCell", bundle: nil)
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
        delegate?.getDigimonData()
        
        // reload the CollectionView after fetching data
        delegate?.update = { [unowned self] in
            DispatchQueue.main.async {
                self.favoritesCollectionView.reloadData()
                print("data reloaded")
            }
        }
        
    }

}

extension FavoritesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        delegate?.getFavoritesIdArrayCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = favoritesCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? DigimonCollectionViewCell else {
            return UICollectionViewCell()
        }
        print("cell created")
        if ((delegate?.favoritesIdArray.contains(indexPath.row)) != nil) {
            cell.nameLabel.text = delegate?.getName(for: indexPath.row)
            if let url = delegate?.getImage(for: indexPath.row) {
                cell.imgLabel.fetchImage(for: url)
            }
            cell.levelLabel.text = delegate?.getLevel(for: indexPath.row)
            print("name of digimon: \(delegate?.getName(for: indexPath.row))")
        }
        return cell
    }
}
