//
//  AddTaskViewController.swift
//  ToDoApp
//
//  Created by Spencer Hurd on 7/21/22.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var newlyAddedTaskName: UITextField!
    
    var taskDelegate: DidSetTasksDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        taskDelegate = navigationController?.viewControllers[0] as? DidSetTasksDelegate
    }
    
    @IBAction func addTaskToList(_ sender: UIButton) {
        guard let delegate = taskDelegate else { return }
        guard let taskName = newlyAddedTaskName.text else { return }
        let task = Task(name: taskName)
        delegate.addedNewTask(task: task)
    }

}
