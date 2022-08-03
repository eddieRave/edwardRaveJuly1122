//
//  ViewController.swift
//  ToDoApp
//
//  Created by Spencer Hurd on 7/20/22.
//

import UIKit

var darkModeIsActive: Bool = false

protocol DidSetTasksDelegate {
    func addedNewTask(task: Task)
}

class ViewController: UIViewController, DidSetTasksDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func triggerDarkMode(_ sender: UIButton) {
        toggleDarkMode()
    }
    
    var tasks = [Task]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
    }
    
    func addedNewTask(task: Task) {
        tasks.append(task)
    }
    
    func configureTable() {
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: "TaskTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
    }
    
    func toggleDarkMode() {
        if !darkModeIsActive {
            view.backgroundColor = .black
            view.tintColor = .white
            tableView.backgroundColor = .black
            tableView.tintColor = .white
            darkModeIsActive.toggle()
        } else {
            view.backgroundColor = .white
            view.tintColor = .black
            tableView.backgroundColor = .white
            tableView.tintColor = .black
            darkModeIsActive.toggle()
        }
//        setNeedsStatusBarAppearanceUpdate()
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? TaskTableViewCell {
            cell.taskName.text = tasks[indexPath.row].value
//            if darkModeIsActive {
//                cell.backgroundColor = .black
//                cell.tintColor = .white
//            } else {
//                cell.backgroundColor = .white
//                cell.tintColor = .black
//            }
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
        100
    }
}

//override var preferredStatusBarStyle: UIStatusBarStyle {
//    if darkModeIsActive {
//        return .lightContent
//    } else {
//        return .lightContent
//    }
//}
