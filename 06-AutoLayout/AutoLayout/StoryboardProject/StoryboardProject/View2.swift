//
//  View2.swift
//  StoryboardProject
//
//  Created by WillC on 7/17/22.
//


import UIKit

class View2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var BUTTON2: UIButton!

 
    @IBAction func DELETE2(_ sender: Any) {
        BUTTON2.removeFromSuperview()
    }
    //    @IBAction func DELETE(_ sender: Any) {
//        BUTTON.removeFromSuperview()
//    }
    
}
