//
//  ViewController.swift
//  Drinks
//
//  Created by Rave Bizz on 7/27/22.
//add a button to the cell's XIB file
//have that button call a method on the viewController

import UIKit
protocol RowRemovable {
    func removeRow(index : Int)
}
class ViewController: UIViewController {
    @IBOutlet weak var tableview: UITableView!
    let viewModel = ViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableview.register(nib, forCellReuseIdentifier: "cell")
        
        viewModel.getData()
        viewModel.update = {
            [unowned self] in
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
        }
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDataSource, RowRemovable{
    func removeRow(index: Int) {
        print(index)
        viewModel.model?.remove(at: index)
//        model.remove(atL index)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = viewModel.getcount()
        return count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TableViewCell{
            cell.idLabel.text = "DELETE CAT"
            //            cell.idLabel.text = viewModel.getId(for: indexPath.row) ?? "no id"
            if let url = viewModel.getImage(for: indexPath.row){
                cell.catImage.fetchImage(for: url)
                print(indexPath.row)

            }
            cell.tag = indexPath.row
            
            cell.rowRemovableDelagate = self
            return cell
        }
        return UITableViewCell()
    }
}

