//
//  ThirdViewController.swift
//  AutoLayout
//
//  Created by Spencer Hurd on 7/16/22.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var midButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func disappearMidButton(_ sender: UIButton) {
        self.midButton.removeFromSuperview()
    }
    

}
