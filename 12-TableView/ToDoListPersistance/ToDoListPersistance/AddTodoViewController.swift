//
//  AddTodoViewController.swift
//  ToDoListPersistance
//
//  Created by Maher Damouni on 8/3/22.
//

import UIKit

class AddTodoViewController: UIViewController {


    var delegate: Addable?
    
    @IBAction func generateButton(_ sender: UIButton) {
        
        delegate?.generateToDo()
    }
    @IBOutlet weak var toDoTextField: UITextField!
    @IBAction func submitToDoButton(_ sender: UIButton) {
        
        delegate?.addToDo(for: toDoTextField.text ?? "default")
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.delegate = (navigationController?.viewControllers[0] as? ViewController)?.viewModel
        // Do any additional setup after loading the view.
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
