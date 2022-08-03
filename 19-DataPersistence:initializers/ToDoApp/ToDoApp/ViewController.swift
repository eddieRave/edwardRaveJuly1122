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
        checkDarkMode()
        accessFile()
    }
    
    func configureTable() {
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: "TaskTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
    }
    
    // Add tasks
    func addedNewTask(task: Task) {
        tasks.append(task)
    }
    
    // Dark Mode
    @IBAction func triggerDarkMode(_ sender: UIButton) {
        toggleDarkMode()
    }
    func toggleDarkMode() {
        darkModeIsActive.toggle()
        print("|||||| TOGGLE: Dark Mode updated to \(String(darkModeIsActive).uppercased())")
        setDefaults()
        checkDarkMode()
        
    }
    func checkDarkMode() {
        print("|||||| CHECK: Dark Mode is currently set to \(String(darkModeIsActive).uppercased())")
        if darkModeIsActive == true {
            view.backgroundColor = .black
            view.tintColor = .white
            tableView.backgroundColor = .black
            tableView.tintColor = .white
        } else {
            view.backgroundColor = .white
            view.tintColor = .black
            tableView.backgroundColor = .white
            tableView.tintColor = .black
        }
        // TODO: Update status bar symbols colors
        // setNeedsStatusBarAppearanceUpdate()
    }
    
    // Persist dark mode data using UserDefaults
    func setDefaults() {
        UserDefaults.standard.set(darkModeIsActive, forKey: "darkMode")
        print("|||||| SET: sent darkMode \(String(darkModeIsActive).uppercased()) to UserDefaults")
    }
    func getDefaults() {
        let dm = UserDefaults.standard.bool(forKey: "darkMode")
        darkModeIsActive = dm
        print("|||||| GET: UserDefaults has a dark mode value of: \(String(darkModeIsActive).uppercased())")
    }
    
    // TODO: Persist tasks data using FileManager
    func saveFile(){
        let cacheDirectory = FileManager.SearchPathDirectory.cachesDirectory
        let folderURLs = FileManager.default.urls(for: cacheDirectory, in: .userDomainMask)
        guard let fileURL = folderURLs.first?.appendingPathComponent("tasks") else { return }
        guard let data = try? JSONEncoder().encode(tasks) else {
            return
        }
        try? data.write(to: fileURL, options: .atomicWrite)
    }
    func accessFile() {
        let cacheDirectory = FileManager.SearchPathDirectory.cachesDirectory
        let folderURLs = FileManager.default.urls(for: cacheDirectory, in: .userDomainMask)
        guard let fileURL = folderURLs.first?.appendingPathComponent("tasks") else { fatalError() }
        guard let data = FileManager.default.contents(atPath: fileURL.path) else {
            fatalError()
        }
        if let decodedTask = try? JSONDecoder().decode(Task.self, from: data) {
            print(decodedTask)
        }
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? TaskTableViewCell {
            cell.taskName.text = tasks[indexPath.row].activity
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
