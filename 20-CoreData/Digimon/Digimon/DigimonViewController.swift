//
//  ViewController.swift
//  Digimon
//
//  Created by Rave Bizz 63 on 8/7/22.
//

import UIKit

// I'm sad to say that I spent a solid hour dealing with not being able to connect
// the IBOutlet because it couldn't find information on ViewController before I figured
// out that I just needed to rename it. Still don't know why that's a thing.
class DigimonViewController: UIViewController {
    var digimonViewModel = DigimonViewModel()
    @IBOutlet weak var digimonCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "DigimonCollectionViewCell", bundle: nil)
        digimonCollectionView.register(nib, forCellWithReuseIdentifier: "DigimonCell")
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical // Vertical scroll makes sense for this app
        // The smallest I can make each cell is 290x290 with my current contraints.
        layout.itemSize = .init(width: 300, height: 300)
        layout.minimumLineSpacing = 15
        digimonCollectionView.collectionViewLayout = layout
        
        digimonViewModel.getDigimon {
            DispatchQueue.main.async { [weak self] in
                self?.digimonCollectionView.reloadData()
            }
        }
    }
}

extension DigimonViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        digimonViewModel.numOfDigimon
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = digimonCollectionView.dequeueReusableCell(withReuseIdentifier: "DigimonCell", for: indexPath) as? DigimonCollectionViewCell else {
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

