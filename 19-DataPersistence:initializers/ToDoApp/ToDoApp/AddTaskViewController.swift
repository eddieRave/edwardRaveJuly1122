//
//  AddTaskViewController.swift
//  ToDoApp
//
//  Created by Spencer Hurd on 7/21/22.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var newlyAddedTaskName: UITextField!
    @IBOutlet weak var apiTask: UILabel!
    
    var taskDelegate: DidSetTasksDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskDelegate = navigationController?.viewControllers[0] as? DidSetTasksDelegate
        fetchTask()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateDarkMode()
    }
    
    @IBAction func addTaskToList(_ sender: UIButton) {
        guard let delegate = taskDelegate else { return }
//        guard let taskName = newlyAddedTaskName.text else { return }
        let taskName = apiTask.text
        let task = Task(activity: taskName)
        delegate.addedNewTask(task: task)
        navigationController?.popViewController(animated: true)
    }
    
    func fetchTask() {
        ApiManager.shared.fetchData() { data in
            if let taskText = data.activity {
                DispatchQueue.main.async {
                    self.apiTask.text = taskText
                }
            }
        }
    }
    
    func updateDarkMode() {
        if darkModeIsActive {
            view.backgroundColor = .black
            view.tintColor = .white
            view.subviews.forEach { (view) in
                 if let label = view as? UILabel {
                      label.textColor = .white
                 }
            }
        } else {
            view.backgroundColor = .white
            view.tintColor = .black
            view.subviews.forEach { (view) in
                 if let label = view as? UILabel {
                      label.textColor = .black
                 }
            }
        }
    }

}
