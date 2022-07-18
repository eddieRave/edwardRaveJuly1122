//
//  ViewController.swift
//  StoryboardProject
//
//  Created by WillC on 7/17/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var BUTTON: UIButton!
 
    @IBAction func DELETE(_ sender: Any) {
        BUTTON.removeFromSuperview()
    }
    
}

