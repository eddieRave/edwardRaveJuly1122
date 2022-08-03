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
    
    @IBAction func addTaskToList(_ sender: UIButton) {
        guard let delegate = taskDelegate else { return }
//        guard let taskName = newlyAddedTaskName.text else { return }
        let taskName = apiTask.text
        let task = Task(value: taskName)
        delegate.addedNewTask(task: task)
        navigationController?.popViewController(animated: true)
    }
    
    func fetchTask() {
        ApiManager.shared.fetchData() { data in
//            print("|||||||| Data is called in fetchTask() ||||||||||", data)
            if let taskText = data.value {
                DispatchQueue.main.async {
                    self.apiTask.text = taskText
                }
            }
        }
    }

}
