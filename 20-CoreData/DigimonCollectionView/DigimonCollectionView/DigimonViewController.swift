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
        digimonVM.getCount() ?? 0
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
        cell.backgroundColor = .blue    // I also set the background color in the cell nib file, but the image covers whole cell so background doesn't show
        return cell
    }
    
}
