//
//  ViewController.swift
//  Digimon
//
//  Created by Rave Bizz 63 on 8/7/22.
//

import UIKit
import CoreData

class DigimonViewController: UIViewController {
    var digimonViewModel = DigimonViewModel()
    @IBOutlet weak var digimonCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "DigimonCollectionViewCell", bundle: nil)
        digimonCollectionView.register(nib, forCellWithReuseIdentifier: "cell")
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical // Vertical scroll makes sense for this app
        // The smallest I can make each cell is 290x290 with my current contraints.
        layout.itemSize = .init(width: 300, height: 300)
        layout.minimumLineSpacing = 15
        digimonCollectionView.collectionViewLayout = layout
        
        digimonViewModel.reloadView = { [unowned self] in
            DispatchQueue.main.async {
                self.digimonCollectionView.reloadData()
            }
        }
        digimonViewModel.getDigimon()
    }
}

extension DigimonViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("rows", digimonViewModel.numOfDigimon)
        return digimonViewModel.numOfDigimon
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = digimonCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? DigimonCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.digimonNameLabel.text = digimonViewModel.getName(for: indexPath.row)
        cell.digimonLevelLabel.text = digimonViewModel.getLevel(for: indexPath.row)
        if let url = digimonViewModel.getImage(for: indexPath.row) {
            cell.digimonImage.fetchImage(for: url)
        }
        return cell
    }
}

