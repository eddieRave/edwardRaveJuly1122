//
//  ViewController.swift
//  ToDoListPersistance
//
//  Created by Maher Damouni on 8/3/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
//    func update() {
//        DispatchQueue.main.async {
//            self.tableView.reloadData()
//        }
//    }
    
    
    var viewModel = ViewModel()
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? toDoCell {
            
            cell.toDoLabel.text = viewModel.toDos[indexPath.row]
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("COUNT>>>>", viewModel.toDos.count)
        return viewModel.toDos.count
    }

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.update = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        let nib = UINib(nibName: "toDoCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! AddTodoViewController
        vc.delegate = self.viewModel
//        vc.dismiss(animated: true)
    }


}
