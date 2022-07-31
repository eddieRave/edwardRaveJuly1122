//
//  BreedViewController.swift
//  CollectionViewAssignment
//
//  Created by Maher Damouni on 7/31/22.
//

import UIKit

class BreedViewController: UIViewController, UITableViewDataSource {
    
    var delegate: ViewController?
    
    @IBOutlet weak var breedTableView: UITableView!
    
    var viewModel: ViewModel?
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.breeds.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = breedTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BreedCellTableViewCell
        guard let viewModel = viewModel else { return UITableViewCell() }

        cell.delegate = delegate
//        cell.dismissDelegate = self
        
        cell.breedLabel.setTitle(viewModel.breeds[indexPath.row], for: UIControl.State.normal)
//        delegate?.setBreed(for: viewModel.breeds[indexPath.row])
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let viewModel = viewModel else { return }
        let nib = UINib(nibName: "BreedCellTableViewCell", bundle: nil)
        breedTableView.register(nib, forCellReuseIdentifier: "cell")

        breedTableView.dataSource = self
        
        viewModel.getBreeds {
            DispatchQueue.main.async {
                print(self.viewModel?.breeds.count)
            }
        }
        
    }
}
