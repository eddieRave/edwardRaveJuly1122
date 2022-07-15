//
//  ViewController4.swift
//  Storyboard
//
//  Created by Kevin McKenney on 7/14/22.
//

import UIKit

class View4Controller: UIViewController {

    @IBOutlet weak var midButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onClickMid(_ sender: Any) {
        midButton.removeFromSuperview()
    }
}
