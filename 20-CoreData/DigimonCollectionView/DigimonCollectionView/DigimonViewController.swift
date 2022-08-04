//
//  ViewController.swift
//  DigimonCollectionView
//
//  Created by Spencer Hurd on 7/30/22.
//

/**
 ASSIGNMENT:
    create a favorites tab in your digimon app
        - create a way to to add a digimon to your favorites in your digimon app the favorites should be display on a second window (TabBarController)
        - add core data to your already existing project
            - https://programmingwithswift.com/add-core-data-to-existing-ios-project/
 */

/**
 TUTORIALS:
 - Tab Bar Quickset: https://guides.codepath.com/ios/Tab-Bar-Quickstart
 */

import UIKit

class DigimonViewController: UIViewController {
    
    @IBOutlet weak var digimonCollectionView: UICollectionView!
    
    let digimonVM = DigimonViewModel()
    
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
        
        // size of cells
        layout.itemSize = .init(width: 300, height: 300)
        
        // spacing between cells
        layout.minimumLineSpacing = 25     // horizontal?
//        layout.minimumInteritemSpacing = 0      // vertical?
        
        // background image for CollectionView
        let bgView = UIView()
        bgView.backgroundColor = UIColor(patternImage: UIImage(named: "cardBg.png")!)
        digimonCollectionView.backgroundView = bgView
        
        // connect layout
        digimonCollectionView.collectionViewLayout = layout
        
        // fetch Digimon data
        digimonVM.getDigimon()
        
        // reload the CollectionView after fetching data
        digimonVM.update = { [unowned self] in
            DispatchQueue.main.async {
                self.digimonCollectionView.reloadData()
            }
        }
        
    }

}

extension DigimonViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        digimonVM.getDigimonArrayCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = digimonCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? DigimonCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.nameLabel.text = digimonVM.getName(for: indexPath.row)
        if let url = digimonVM.getImage(for: indexPath.row) {
            cell.imgLabel.fetchImage(for: url)
        }
        cell.levelLabel.text = digimonVM.getLevel(for: indexPath.row)
        
        // I also set the background color in the cell nib file, but the image covers whole cell so background doesn't show
        cell.backgroundColor = .blue
        
        // link delegate to ViewModel and indexPath
        cell.delegate = digimonVM
        cell.digimonIndex = indexPath.row
        
        return cell
    }
    
}

protocol Favoritable {
    func addToFavorites(digimonIndexPath: Int)
}
