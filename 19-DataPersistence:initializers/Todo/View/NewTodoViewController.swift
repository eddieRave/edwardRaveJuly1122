//
//  NewTodoViewController.swift
//  Todo
//
//  Created by Joel Maldonado on 7/20/22.
//

import UIKit

protocol TaskDelegate {
    func addTodo(_ todo: Todo)
}

class NewTodoViewController: UIViewController {
    
    var taskDelegate: TaskDelegate?

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveTodo))
        navigationItem.title = "New Todo Item"
    }
    
    @objc func saveTodo(_ sender: Any) {
        guard let text = textField.text else { return }
        if text != "" {
            let newTodo = Todo(activity: text)
            taskDelegate?.addTodo(newTodo)
            navigationController?.popViewController(animated: true)
        }else {
            textField.placeholder = "Must enter todo to save"
        }
    }
    
    @IBAction func addRandomTodo(_ sender: Any) {
        APIManager.shared.fetchTodo {
            todo in
            DispatchQueue.main.async {
                self.taskDelegate?.addTodo(todo)
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
