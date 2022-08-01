//
//  ViewController.swift
//  ViewCollectionDigimon
//
//  Created by Rave Bizz 41 on 7/29/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 160, height: 160)
        collectionView.collectionViewLayout = layout
        collectionView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: CollectionViewCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        viewModel.update = {
            [unowned self] in
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
    }
    
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        // Console prints this message when clicked on visible Digimon
        print("The cell is visible")
    }
}

extension ViewController: UICollectionViewDataSource {
    // Return specified number of cells
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.getCount() ?? 0
    }
    
    // Fill in an individual collection view cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
            cell.digimonName.text = viewModel.getName(for: indexPath.row) ?? "no name"
            if let img = viewModel.getImage(for: indexPath.row) {
                cell.digimonImage.fetchImage(for: img)
            }
            //cell.digimonLevel.text = viewModel.getLevel(for: indexPath.row)
            return cell
        }
    }



extension ViewController: UICollectionViewDelegateFlowLayout {
    // Set the size of a cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 160)
    }
}


