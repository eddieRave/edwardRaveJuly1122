//
//  ViewController.swift
//  CollectionViewAssignment
//
//  Created by Maher Damouni on 7/30/22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, Breedable {
    
    @IBAction func clickFilter(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "BreedViewController", bundle: nil)
        guard let breedVC = storyboard.instantiateViewController(withIdentifier: "BreedViewController") as? BreedViewController else { return }
        
        breedVC.viewModel = viewModel
        breedVC.delegate = self
        navigationController?.show(breedVC, sender: nil)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.dogImage.image = viewModel.dogPictures[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.dogPictures.count
    }
    
    
    let viewModel = ViewModel()
    
    func reloadCollectionView () {
        
        viewModel.getImageURLS(for: currentBreed ?? "") {
            self.viewModel.getDogImages {
                
                DispatchQueue.main.async{
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    var currentBreed: String? {
        didSet {
            currentBreedLabel.text = currentBreed
            reloadCollectionView()
        }
    }
    
    func setBreed(for breed: String) {
        print("FIRED")
        currentBreed = breed
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var currentBreedLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //        collectionView.dataSource = self
        
        currentBreed = "pug"
        
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        let layout = UICollectionViewFlowLayout()
        //        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: 185, height: 200)
        //        layout.minimumLineSpacing = 0
        //        layout.minimumInteritemSpacing = 20
        //        layout.
        //        self.currentBreedLabel = self
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        collectionView.frame = .zero
        collectionView.collectionViewLayout = layout
        collectionView.dataSource = self
        
        reloadCollectionView()
        
        viewModel.getBreeds {
            DispatchQueue.main.async {
                print(self.viewModel.breeds.count)
            }
        }
    }
}

