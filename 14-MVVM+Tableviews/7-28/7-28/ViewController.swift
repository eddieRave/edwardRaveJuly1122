//
//  ViewController.swift
//  7-28
//
//  Created by Rave Bizz 63 on 7/28/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var randomString = Array(repeating: "Input", count: 5)
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        randomString.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.cell()
        cell.textLabel?.text = randomString[indexPath.section]
        return cell
    }
}
