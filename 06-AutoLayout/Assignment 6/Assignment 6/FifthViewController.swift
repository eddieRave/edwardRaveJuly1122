//
//  FifthViewController.swift
//  Assignment 6
//
//  Created by Rave Bizz 63 on 7/18/22.
//

import UIKit

class FifthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func deleteButton(_ sender: UIButton) {
            sender.removeFromSuperview()
        }
}
