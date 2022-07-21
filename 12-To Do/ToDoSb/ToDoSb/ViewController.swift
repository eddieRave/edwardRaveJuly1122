//
//  ViewController.swift
//  ToDoSb
//
//  Created by Kevin McKenney on 7/20/22.
//

import UIKit

class ViewController: UIViewController, DataEnteredDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var toDoList: [String] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? ToDoItem {
            cell.label.text = toDoList[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    
    
    
    func userDidEnterInformation(info: String) {
        
        toDoList.append(info)
        toDoTable.reloadData()
    }
    
    func configureTable() {
        toDoTable.delegate = self
        toDoTable.dataSource = self
        let nib = UINib(nibName: "ToDoItem", bundle: nil)
        toDoTable.register(nib, forCellReuseIdentifier: "Cell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var toDoTable: UITableView!
    
    
}

protocol DataEnteredDelegate: AnyObject {
    func userDidEnterInformation(info: String)
}


