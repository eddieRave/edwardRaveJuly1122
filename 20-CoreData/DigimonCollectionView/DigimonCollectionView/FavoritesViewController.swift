//
//  FavoritesViewController.swift
//  DigimonCollectionView
//
//  Created by Spencer Hurd on 8/4/22.
//

import UIKit

class FavoritesViewController: UIViewController {

    @IBOutlet weak var favoritesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // register cell & connect with CollectionView
        let nib = UINib(nibName: "FavoritesCollectionViewCell", bundle: nil)
        favoritesCollectionView.register(nib, forCellWithReuseIdentifier: "cellF")
        
        // connect extension functions with CollectionView
        favoritesCollectionView.dataSource = self
        
        // horizontal scroll
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        // size of cells
        layout.itemSize = .init(width: 300, height: 300)
        
        // spacing between cells
        layout.minimumLineSpacing = 25
        
        // background image for CollectionView
//        let bgView = UIView()
//        bgView.backgroundColor = UIColor(patternImage: UIImage(named: "cardBg.png")!)
//        favoritesCollectionView.backgroundView = bgView
        
        // connect layout
        favoritesCollectionView.collectionViewLayout = layout
        
    }

}

extension FavoritesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
//        digimonVM.getFavoritesCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = favoritesCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? DigimonCollectionViewCell else {
            return UICollectionViewCell()
        }
        
//        cell.nameLabel.text = digimonVM.getName(for: indexPath.row)
//        if let url = digimonVM.getImage(for: indexPath.row) {
//            cell.imgLabel.fetchImage(for: url)
//        }
//        cell.levelLabel.text = digimonVM.getLevel(for: indexPath.row)
        
        return cell
    }
}
