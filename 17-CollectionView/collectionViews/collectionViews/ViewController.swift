//
//  ViewController.swift
//  collectionViews
//
//  Created by Rave Bizz on 7/29/22.
//

import UIKit


class ViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    

    

//    func configureTable(){
//        tableView.dataSource = self
//        tableView.delegate = self
//        let nib = UINib(nibName: "MyTableViewCell", bundle: nil)
//        tableView.register(nib, forCellReuseIdentifier: "Cell")
//
//    }
    func configureCollection(){
        super.viewDidLoad()
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: 100, height: 50)
        layout.minimumLineSpacing = 0
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        collectionView.collectionViewLayout = layout
    }
    
    var vm : ViewModel? = nil
    override func viewDidLoad() {
        vm = ViewModel()
//        layout.minimumInteritemSpacing = 20
        configureCollection()
//        vm?.getData{
//            collectionView.reloadData()
//        }
        vm?.getData()
        vm?.update = {
            [unowned self] in
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
        }
       
    }
}

extension ViewController: UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as?  CollectionViewCell else {
            return UICollectionViewCell()
        }
        if let url = vm?.getImage(for: indexPath.row){
            cell.digimonImage.fetchImage(for: url)
          }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        vm?.getCount() ?? 0
    }
    
}

