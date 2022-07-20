//
//  ViewController.swift
//  ToDoApp
//
//  Created by Spencer Hurd on 7/20/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var newlyAddedTaskName: UITextField!
    @IBAction func addTaskToList(_ sender: UIButton) {
        let task = Task(name: newlyAddedTaskName?.text)
        tasks.append(task)
    }
    
    var tasks: [Task] = []
    
    // PLACEHOLDER:
//    var task1 = Task(name: "Task 1")
//    var task2 = Task(name: "Task 2")
//    lazy var tasks: [Task] = [task1, task2]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureTable()
    }
    
    func configureTable() {
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: "TaskTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? TaskTableViewCell {
            // TODO: Loop through tasks array and display each item as a cell in tableView
            cell.taskName.text = tasks[indexPath.row].name
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // # of rows
        tasks.count
    }
    
}

extension ViewController: UITableViewDelegate {
    // height for each view:
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
}
