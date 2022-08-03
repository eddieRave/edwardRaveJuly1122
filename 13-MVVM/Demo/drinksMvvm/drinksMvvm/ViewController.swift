//
//  ViewController.swift
//  drinksMvvm
//
//  Created by Rave Bizz on 5/5/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: DrinkViewModel = DrinkViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        viewModel.fetchData {
            self.tableView.reloadData()
        }
    }
    
    func configureTableView() {
        tableView.dataSource = self
        tableView.register(UINib(nibName: DrinkCell.identifier, bundle: nil), forCellReuseIdentifier: DrinkCell.identifier)
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numDrinks
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DrinkCell.identifier, for: indexPath) as? DrinkCell else {
            return UITableViewCell()
        }
        let vm = viewModel.getCellVM(indexPath)
        cell.configure(vm: vm)
        return cell
    }
    
}

