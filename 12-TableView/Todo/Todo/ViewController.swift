//
//  ViewController.swift
//  Todo
//
//  Created by Joel Maldonado on 7/20/22.
//

import UIKit

protocol TaskDelegate {
    func addTask(task: String)
}

class ViewController: UIViewController, TaskDelegate {

    var todos = [String]() {
        didSet{
            DispatchQueue.main.async {
                self.todoListTable.reloadData()
            }
        }
    }
    
    @IBOutlet weak var todoListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureTable()
    }
    
    @IBAction func addTodo(_ sender: Any) {
        if let addTodoVC = storyboard?.instantiateViewController(withIdentifier: "NewTodoVC") as? NewTodoViewController{
            addTodoVC.taskDelegate = self
            if let navigation = navigationController {
                navigation.pushViewController(addTodoVC, animated: true)
            }
        }
    }
    
    func configureTable() {
        todoListTable.dataSource = self
        todoListTable.delegate = self
        let nib = UINib(nibName: "todoListTableViewCell", bundle: nil)
        todoListTable.register(nib, forCellReuseIdentifier: "Cell")
    }
    
    func addTask(task: String) {
        todos.append(task)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = todoListTable.dequeueReusableCell(withIdentifier: "Cell") as? todoListTableViewCell {
            print("here")
            cell.todoLabel.text = todos[indexPath.row]
            return cell
        }
        
        return UITableViewCell()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}

