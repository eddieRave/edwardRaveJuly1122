//
//  AddTodoViewController.swift
//  ToDo-List
//
//  Created by Maher Damouni on 7/21/22.
//

import UIKit

class AddTodoViewController: UIViewController {

    var todoDelegate: Todoable?
    
    @IBOutlet weak var todoText: UITextField!
    
    @IBAction func submitButton(_ sender: UIButton) {
        
        guard let todoDelegate = todoDelegate else { return }
        guard let todoText = todoText.text else { return }
        todoDelegate.addToTodoArray(inputText: todoText)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        todoDelegate = navigationController?.viewControllers[0] as? Todoable
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
