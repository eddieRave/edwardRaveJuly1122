//
//  ViewController.swift
//  mvvm
//
//  Created by Rave Bizz on 5/6/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var centerLabel: UILabel!
    var viewModel = ViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.updateUI = {
            DispatchQueue.main.async {
                self.centerLabel.text = self.viewModel.modelText
            }
        }
        // networking call: set data to google
        viewModel.getData()
        // manually set data to amazon
        viewModel.changeData()
    }
}
