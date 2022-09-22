//
//  FavoriteDigimonViewController.swift
//  Digimon
//
//  Created by Rave Bizz 63 on 8/15/22.
//

import UIKit
import CoreData

class FavoriteDigimonViewController: UIViewController {
    @IBOutlet weak var favoriteDigimonCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "DigimonCollectionViewCell", bundle: nil)
        favoriteDigimonCollection.register(nib, forCellWithReuseIdentifier: "cell")
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical // Vertical scroll makes sense for this app
        // The smallest I can make each cell is 290x290 with my current contraints.
        layout.itemSize = .init(width: 300, height: 300)
        layout.minimumLineSpacing = 15
        favoriteDigimonCollection.collectionViewLayout = layout
    }
}
