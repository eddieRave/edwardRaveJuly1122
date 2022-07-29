//
//  ViewController.swift
//  DigimonCollectionView
//
//  Created by Joel Maldonado on 7/29/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var digimonCollection: UICollectionView!
    
    let digiViewModel = DigiViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureCollection()
        digiViewModel.fetchDigimon {
            DispatchQueue.main.async { [weak self] in
                self?.digimonCollection.reloadData()
            }
        }
    }
    
    func configureCollection() {
        let nib = UINib(nibName: "DigimonCell", bundle: nil)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: 250, height: 250)
        
        digimonCollection.register(nib, forCellWithReuseIdentifier: "digiCell")
        digimonCollection.collectionViewLayout = layout
        digimonCollection.dataSource = self
    }
    
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        digiViewModel.numDigimon
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = digimonCollection.dequeueReusableCell(withReuseIdentifier: "digiCell", for: indexPath) as? DigimonCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(digimon: digiViewModel.getDigimon(at: indexPath.row))
        return cell
    }
}

