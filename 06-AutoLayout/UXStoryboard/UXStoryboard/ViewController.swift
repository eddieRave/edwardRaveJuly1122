//
//  ViewController.swift
//  UXStoryboard
//
//  Created by Kevin McKenney on 7/15/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onClick(_ sender: Any) {
        button.removeFromSuperview()
    }
}

