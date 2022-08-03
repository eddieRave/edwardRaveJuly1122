//
//  ViewController.swift
//  ToDoListPersistance
//
//  Created by Maher Damouni on 8/3/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var ToDoListLabel: UILabel!
    var viewModel = ViewModel()
    
    @IBOutlet weak var darkModeButtonOutlet: UIButton!
    
    @IBAction func darkModeButton(_ sender: UIButton) {
//        print(darkModeButtonOutlet.titleLabel?.text)
        
        if viewModel.darkMode == true {
            
            darkModeButtonOutlet.setTitle("🌕", for: .normal)
            tableView.backgroundColor = UIColor .black
            viewModel.darkMode = false
            viewModel.setDarkMode()
        } else {
            
            darkModeButtonOutlet.setTitle("🔆", for: .normal)
            tableView.backgroundColor = UIColor .white
            viewModel.darkMode = true
            viewModel.setDarkMode()
        }
        
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? toDoCell {
            
//            lightMode ? cell.backgroundColor = UIColor .white : cell.backgroundColor = UIColor .black
            if viewModel.darkMode == true {
                cell.backgroundColor = UIColor .white
                cell.toDoLabel.textColor = UIColor .black
            
//                cell.toDoLabel.text = viewModel.toDos[indexPath.row]
            } else {
                cell.backgroundColor = UIColor .black
                cell.toDoLabel.textColor = UIColor .white
            }
            cell.toDoLabel.text = viewModel.toDos[indexPath.row]
//            cell.toDoLabel.text = viewModel.toDos[indexPath.row]
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
        
        viewModel.getDefaultsForDarkMode()
        viewModel.getToDos()
        
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
