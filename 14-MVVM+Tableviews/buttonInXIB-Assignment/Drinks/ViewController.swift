//
//  ViewController.swift
//  Drinks
//
//  Created by Rave Bizz on 7/27/22.
//

import UIKit

protocol CellDelegate {
    func printCountOfCats() -> String
}

class ViewController: UIViewController, CellDelegate {
    
    @IBOutlet weak var tableview: UITableView!
    
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableview.dataSource = self
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableview.register(nib, forCellReuseIdentifier: "cell")
        viewModel.getData()
        viewModel.update = { [unowned self] in
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
        }
    }
    
    func printCountOfCats() -> String {
        let numOfCats = viewModel.getcount() ?? 0
        let countText = "\(numOfCats)"
        print("There are \(numOfCats) cats")
        return countText
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = viewModel.getcount()
        return count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TableViewCell{
            cell.idLabel.text = viewModel.getId(for: indexPath.row) ?? "no id"
            if let url = viewModel.getImage(for: indexPath.row){
                cell.catImage.fetchImage(for: url)
            }
            cell.delegate = self
            return cell
        }
        return UITableViewCell()
    }
}

