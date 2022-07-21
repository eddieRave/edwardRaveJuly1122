//
//  ViewController.swift
//  ToDo-List
//
//  Created by Maher Damouni on 7/20/22.
//

import UIKit

protocol Todoable{
    
    func addToTodoArray(inputText: String)
}

class ViewController: UIViewController, Todoable {
    
    func addToTodoArray(inputText: String) {
        todos.insert(inputText, at: 0)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var todos = ["buy groceries", "buy detergent", "get swole"] {
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
//    @IBAction func submitButton(_ sender: UIButton) {
//
////        print(todoText.text!)
//        if let textInField = todoText.text {
//            todos.append(textInField)
//        }
//        print(todos)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        navigationController?.viewControllers[0] as? AddTodoViewController()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(todos)
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        let nib =
        
        cell.textLabel?.text = todos[indexPath.row]
        
        return cell
    }
}
