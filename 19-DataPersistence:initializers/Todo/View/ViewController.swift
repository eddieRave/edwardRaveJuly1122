//
//  ViewController.swift
//  Todo
//
//  Created by Joel Maldonado on 7/20/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var todoListTable: UITableView!
    @IBOutlet weak var appearanceButton: UIBarButtonItem!
    
    let todoListVM = TodoListViewModel()
    var darkMode = false {
        didSet {
            DispatchQueue.main.async {
                self.appearanceButton.image = self.darkMode ? UIImage(systemName: "sun.max.circle.fill") : UIImage(systemName: "moon.circle")
                self.saveDefaults()
                
                self.view.window?.overrideUserInterfaceStyle = self.darkMode ? .dark : .light
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadDefaults()
        print(darkMode)
        configureTable()
        todoListVM.bindTodoList = { [weak self] in
            DispatchQueue.main.async {
                self?.todoListTable.reloadData()
            }
        }
        
        todoListVM.loadData()
//        view.window?.overrideUserInterfaceStyle = darkMode ? .dark : .light
    }
    
    @IBAction func themeButtonPressed(_ sender: Any) {
        darkMode.toggle()
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        if let addTodoVC = storyboard?.instantiateViewController(withIdentifier: "NewTodoVC") as? NewTodoViewController{
            addTodoVC.taskDelegate = todoListVM
            if let navigation = navigationController {
                navigation.pushViewController(addTodoVC, animated: true)
            }
        }
    }
    
    func configureTable() {
        todoListTable.dataSource = self
        let nib = UINib(nibName: "todoListTableViewCell", bundle: nil)
        todoListTable.register(nib, forCellReuseIdentifier: "Cell")
    }
    
    func loadDefaults() {
        darkMode = UserDefaults.standard.bool(forKey: "darkMode")
        view.window?.overrideUserInterfaceStyle = darkMode ? .dark : .light
    }
    
    func saveDefaults() {
        UserDefaults.standard.set(darkMode, forKey: "darkMode")
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todoListVM.numTodos
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = todoListTable.dequeueReusableCell(withIdentifier: "Cell") as? todoListTableViewCell {
            let currentTodo = todoListVM.getTodo(at: indexPath.row)
            cell.configure(todo: currentTodo)
            return cell
        }
        
        return UITableViewCell()
    }
}

