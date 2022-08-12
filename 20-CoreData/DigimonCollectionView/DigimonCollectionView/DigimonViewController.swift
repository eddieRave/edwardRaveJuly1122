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
import CoreData

#warning("Favorites are recycled in the view")

#warning("Where to call CoreData StoreData function?")

let digimonVM = DigimonViewModel()

class DigimonViewController: UIViewController {
    
    @IBOutlet weak var digimonCollectionView: UICollectionView!
    
//    let digimonVM = DigimonViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register cell & connect with CollectionView
        let nib = UINib(nibName: "DigimonCollectionViewCell", bundle: nil)
        digimonCollectionView.register(nib, forCellWithReuseIdentifier: "cell")
        
        // Connect extension functions with CollectionView
        digimonCollectionView.dataSource = self
        
        // Horizontal scroll
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        // The size of the cells
        layout.itemSize = .init(width: 300, height: 300)
        
        // Spacing between cells
        layout.minimumLineSpacing = 25     // horizontal?
//        layout.minimumInteritemSpacing = 0      // vertical?
        
        // Background image for CollectionView
        let bgView = UIView()
        bgView.backgroundColor = UIColor(patternImage: UIImage(named: "cardBg.png")!)
        digimonCollectionView.backgroundView = bgView
        
        // Connect the layout
        digimonCollectionView.collectionViewLayout = layout
        
        // Fetch Digimon data
        digimonVM.getDigimonData()
        
        // Reload the CollectionView after fetching data
        digimonVM.update = { [unowned self] in
            DispatchQueue.main.async {
                self.digimonCollectionView.reloadData()
                // Save to CoreData
                self.storeCoreData()
            }
        }
        
        // Fetch from CoreData
        fetchCoreData()
        digimonVM.favoritesIdArray = digimonVM.convertStringToArrayOfInt(stringOfInt: digimonVM.stringCopyOfFavoritesIdArray)
        
    }

    
    func storeCoreData() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let context = appDelegate?.persistentContainer.viewContext else {
            fatalError()
        }
        guard let entity = NSEntityDescription.entity(forEntityName: "Favorites", in: context) else {
            return
        }
        let favoritesEntity = NSManagedObject(entity: entity, insertInto: context)
        favoritesEntity.setValue(digimonVM.stringCopyOfFavoritesIdArray, forKey: "favArrayCD")
        do {
            try context.save()
            print("STORE: Saved the following string to CoreData: \(digimonVM.stringCopyOfFavoritesIdArray)")
        } catch {
            print(error)
        }
    }
    func fetchCoreData() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let context = appDelegate?.persistentContainer.viewContext else {
            fatalError()
        }
        let request = NSFetchRequest<Favorites>(entityName: "Favorites")
        do {
            let storedFavorites = try context.fetch(request)
            print("FETCH: Retrieved the following string from CoreData: \(storedFavorites)")
            // TODO: loop through the array of favorites (retrieved from storedFavorites) and add each id to a new array which then gets saved to the favorites array
            var copyOfFavIds: [String] = []
            for fav in storedFavorites {
                copyOfFavIds.append(fav.favArrayCD ?? "NoData")
            }
            print("FETCH: copyOfFavIds = \(copyOfFavIds)")
            digimonVM.stringCopyOfFavoritesIdArray = storedFavorites.last?.favArrayCD ?? ""
            print("FETCH: stringCopyOfFavoritesIdArray is now equal to: \(digimonVM.stringCopyOfFavoritesIdArray)")
        } catch {
            print(error)
        }
    }

}

extension DigimonViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        digimonVM.getDigimonArrayCount()
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
        cell.indexPathRow = indexPath.row
        
        return cell
    }
    
}
