//
//  ViewController.swift
//  ToDoApp
//
//  Created by Spencer Hurd on 7/20/22.
//

/**
 ASSIGNMENT 19
 1. integrate bored api in todo app
    - https://www.boredapi.com/api/activity/
 2. create option. for dark mode for your todo app
    - create an option for your user to switch into dark mode this mode should persist through out separate launches use UserDefaults to accomplish this
 3. persist todo app data
    - use fileManager to get your todo list to persist across multiple launches
 */

import UIKit

protocol DidSetTasksDelegate {
    func addedNewTask(task: Task)
}

var darkModeIsActive: Bool = false

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
        getDefaults()
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
        print("|||||| Dark Mode updated to \(darkModeIsActive)")
        setDefaults()
        // TODO: Update status bar symbols colors
//        setNeedsStatusBarAppearanceUpdate()
    }
    
    // Persist dark mode data using UserDefaults
    func setDefaults() {
        UserDefaults.standard.set(darkModeIsActive, forKey: "darkMode")
        print("|||||| SET darkMode of \(darkModeIsActive) to UserDefaults")
    }
    func getDefaults() {
        let dm = UserDefaults.standard.bool(forKey: "darkMode")
        darkModeIsActive = dm
        print("|||||| GET UserDefaults has a dark mode value of: \(darkModeIsActive)")
    }
    
    // TODO: Persist tasks cells data using FileManager

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? TaskTableViewCell {
            cell.taskName.text = tasks[indexPath.row].value
            // TODO: Update cells with dark mode colors
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

// TODO: Update status bar symbols colors
//override var preferredStatusBarStyle: UIStatusBarStyle {
//    if darkModeIsActive {
//        return .lightContent
//    } else {
//        return .lightContent
//    }
//}
