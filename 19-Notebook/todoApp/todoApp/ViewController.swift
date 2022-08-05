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

var testArr: [String] = []

let theme = Theme()

class ViewController: UIViewController, textDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textFromBox: UITextView!

    @IBAction func DarkButton(_ sender: Any) {
        Theme.shared.setColorTheme(themeString: "DARK_THEME", view: self.view)
    }
    
    @IBAction func LightButton(_ sender: Any) {
        theme.setColorTheme(themeString: "LIGHT_THEME", view: self.view)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        theme.setColorTheme(themeString: theme.getSavedColorTheme(), view: self.view)
        configureTable()
    }
    
    func sendText(text: String) {
        decodeAPI() { string in
            testArr.append(string)

            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
        }
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
       100
    }
}
