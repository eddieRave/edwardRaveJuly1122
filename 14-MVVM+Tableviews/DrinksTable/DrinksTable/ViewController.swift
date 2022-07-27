//
//  ViewController.swift
//  DrinksTable
//
//  Created by Joel Maldonado on 7/27/22.
//

import UIKit

class ViewController: UIViewController {

    let drinkViewModel = DrinkViewModel()
    
    @IBOutlet weak var drinksTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        drinksTable.dataSource = self
        let nib = UINib(nibName: "DrinkCell", bundle: nil)
        drinksTable.register(nib, forCellReuseIdentifier: "drinkCell")
        bindDrinkList()
        drinkViewModel.getDrinks()
    }

    func bindDrinkList() {
        drinkViewModel.onChange = { [weak self] in
            DispatchQueue.main.async {
                self?.drinksTable.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        drinkViewModel.numDrinks
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "drinkCell") as? DrinkCell else {
            return UITableViewCell()
        }
        
        cell.drinkName.text = drinkViewModel.getName(for: indexPath.row)
        
        if let url = drinkViewModel.getImg(for: indexPath.row) {
            cell.drinkImg.getImage(url: url)
        }
        
        return cell
    }
}

