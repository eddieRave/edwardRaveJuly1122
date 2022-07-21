//
//  ViewController.swift
//  todoApp
//
//  Created by WillC on 7/20/22.
//

import UIKit
protocol textDelegate{
    func sendText(text : String) 
}

var testArr :[String] = [""]

class ViewController: UIViewController, textDelegate {
    
    func sendText(text: String) {
        print(text)
        testArr.append(text)
        self.tableView.reloadData()
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textFromBox: UITextView!
    @IBOutlet weak var labelForOutput: UILabel!
//
//    var notes[]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureTable()
    }
    

    func configureTable(){
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: "NotesTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
    }
}


extension ViewController :  UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? NotesTableViewCell{
            cell.tableViewLabel.text = testArr[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        testArr.count
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        30
    }
}
