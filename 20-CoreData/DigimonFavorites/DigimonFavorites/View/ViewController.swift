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
        digiViewModel.onChange = { [weak self] in
            self?.updateTable()
        }
        digiViewModel.getDigimon()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        digiViewModel.checkFavorites()
        updateTable()
    }
    
    func configureCollection() {
        let nib = UINib(nibName: "DigimonCell", bundle: nil)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: 200, height: 240)
        
        digimonCollection.register(nib, forCellWithReuseIdentifier: "digiCell")
        digimonCollection.collectionViewLayout = layout
        digimonCollection.dataSource = self
    }
    
    func updateTable() {
        DispatchQueue.main.async {
            self.digimonCollection.reloadData()
        }
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
        
        cell.configure(vm: digiViewModel.getDigiCellVM(at: indexPath.row))
        return cell
    }
}

