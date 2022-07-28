//
//  ViewController.swift
//  TableView
//
//  Created by Rave Bizz on 7/20/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var people: [Mod] = []{
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        configureTable()
        // Do any additional setup after loading the view.
    }
    
    func fetchData(){
        NetworkManager.shared.FetchData(completion: {
            people in
            self.people = people
        })
    }
    func configureTable(){
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: "MyTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
        
    }
    

}


extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? MyTableViewCell{
            cell.nameLabel.text = people[indexPath.row].name
            cell.ageLabel.text = people[indexPath.row].age
            cell.tag = indexPath.row
            cell.rowRemovingDelegate = self
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        people.count
    }
}

extension ViewController: UITableViewDelegate { }

extension ViewController: RowRemoving {
    func removeRow(at row: Int) {
        people.remove(at: row)
    }
}

protocol RowRemoving {
    func removeRow(at row: Int)
}
