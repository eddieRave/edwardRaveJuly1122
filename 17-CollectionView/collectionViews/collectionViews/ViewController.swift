//
//  ViewController.swift
//  collectionViews
//
//  Created by Rave Bizz on 7/29/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    let colors: [UIColor] = [.blue, .cyan, .systemMint, .systemTeal, .systemPurple, .systemOrange, .systemRed, .green, .magenta, .systemIndigo,.blue, .cyan, .systemMint, .systemTeal, .systemPurple, .systemOrange, .systemRed, .green, .magenta, .systemIndigo,.blue, .cyan, .systemMint, .systemTeal, .systemPurple, .systemOrange, .systemRed, .green, .magenta, .systemIndigo,.blue, .cyan, .systemMint, .systemTeal, .systemPurple, .systemOrange, .systemRed, .green, .magenta, .systemIndigo,.blue, .cyan, .systemMint, .systemTeal, .systemPurple, .systemOrange, .systemRed, .green, .magenta, .systemIndigo,.blue, .cyan, .systemMint, .systemTeal, .systemPurple, .systemOrange, .systemRed, .green, .magenta, .systemIndigo,.blue, .cyan, .systemMint, .systemTeal, .systemPurple, .systemOrange, .systemRed, .green, .magenta, .systemIndigo,.blue, .cyan, .systemMint, .systemTeal, .systemPurple, .systemOrange, .systemRed, .green, .magenta, .systemIndigo]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: 100, height: 50)
        layout.minimumLineSpacing = 0
//        layout.minimumInteritemSpacing = 20
//        layout.
        
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        collectionView.collectionViewLayout = layout
        collectionView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = colors[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        colors.count
    }
    
}

