//
//  ViewController.swift
//  UI-assignment-06
//
//  Created by Maher Damouni on 7/15/22.
//

import UIKit

class ViewController: UIViewController {

    let label = UILabel()

    @IBOutlet weak var midButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func leftButton(_ sender: UIButton, forEvent event: UIEvent) {
        self.midButton.removeFromSuperview()
    }
}

