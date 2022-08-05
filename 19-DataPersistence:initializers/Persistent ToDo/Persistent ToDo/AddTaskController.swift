//
//  AddTaskController.swift
//  Persistent ToDo
//
//  Created by Rave Bizz 63 on 8/5/22.
//

import UIKit

protocol AddTask {
    func addTask(task: String)
}

class AddTaskController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func addButton(_ sender: Any) {
        if textField.text != "" {
            delegate?.addTask(task: textField.text!)
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func addRandomTaskButton(_ sender: Any) {
        Networking.shared.fetchToDo { toDo in
            DispatchQueue.main.async {
                self.textField.text = toDo.activity            }
        }
    }
    var delegate: AddTask?
}
