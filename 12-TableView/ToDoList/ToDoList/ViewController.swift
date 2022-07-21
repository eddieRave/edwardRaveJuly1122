//
//  ViewController.swift
//  ToDoList
//
//  Created by Rave Bizz 41 on 7/20/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    // This will show the TableView necessary to see the tasks
    private let table: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    // This array will hold the user input
    var items = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.items = UserDefaults.standard.stringArray(forKey: "items") ?? []
        title = "ToDoList"
        view.addSubview(table)
        table.dataSource = self
        
        // Adds a + button on the top right to add tasks and calls didTapAddTask
        // to do the actual user inputting
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAddTask))
    }
    
    // This is the function that does our primary objective: to add items to a list
    @objc private func didTapAddTask() {
        // Define an alert box to add our user input
        let inputBox = UIAlertController(title: "New Task", message: "Enter a task for to do List", preferredStyle: .alert)
        
        // Add text
        inputBox.addTextField { field in
            field.placeholder = "Enter task...."
        }
        
        // This button will cancel the action of adding a task
        inputBox.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        // This button will add the task to the to do list
        inputBox.addAction(UIAlertAction(title: "Add", style: .default, handler: { [weak self] (_) in
            if let field = inputBox.textFields?.first {
                if let text = field.text, !text.isEmpty {
                    
                    // Enter to do list item
                    DispatchQueue.main.async {
                        var currentItems = UserDefaults.standard.stringArray(forKey: "items") ?? []
                        currentItems.append(text)
                        UserDefaults.standard.setValue(currentItems, forKey: "items")
                        self?.items.append(text)
                        self?.table.reloadData()
                    }
                }
            }
        }))
        
        // This will display the box to input a task
        present(inputBox, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
    }
    
    //----------------------------------------
    // Protocol functions for UITableViewDataSource protocol
    //----------------------------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
}

