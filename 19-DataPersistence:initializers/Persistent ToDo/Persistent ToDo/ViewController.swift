//
//  ViewController.swift
//  Persistent ToDo
//
//  Created by Rave Bizz 63 on 8/5/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddTask {

    override func viewDidLoad() {
        super.viewDidLoad()
        tasks.append(Task(task: "Test Object"))
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks: [Task] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskCell
        
        cell.taskNameLabel.text = tasks[indexPath.row].task
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AddTaskController
        vc.delegate = self
    }
    
    func addTask(task: String) {
        tasks.append(Task(task: task))
        tableView.reloadData()
    }
}

class Task {
    var task = ""
    
    convenience init(task: String) {
        self.init()
        self.task = task
    }
}

