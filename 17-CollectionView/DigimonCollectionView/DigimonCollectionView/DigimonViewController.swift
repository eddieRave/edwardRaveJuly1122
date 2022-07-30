//
//  ViewController.swift
//  DigimonCollectionView
//
//  Created by Spencer Hurd on 7/30/22.
//

/**
 ASSIGNMENT:
     Create a collection view in mvvm format using data from this api
        https://digimon-api.vercel.app/api/digimon
 */

import UIKit

class DigimonViewController: UIViewController {
    
    @IBOutlet weak var digimonCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // register cell & connect with CollectionView
        let nib = UINib(nibName: "DigimonCollectionViewCell", bundle: nil)
        digimonCollectionView.register(nib, forCellWithReuseIdentifier: "cell")
        // connect extension functions with CollectionView
        digimonCollectionView.dataSource = self
        // horizontal scroll
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal 
        layout.itemSize = .init(width: 200, height: 200)
//        layout.minimumLineSpacing = 5 // horizontal, defaults to 10
//        layout.minimumInteritemSpacing = 5 // vertical?, defaults to 10?
        digimonCollectionView.collectionViewLayout = layout
    }

}

extension DigimonViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = digimonCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .black
        return cell
    }
    
}
