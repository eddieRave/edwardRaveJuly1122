//
//  ViewController.swift
//  TabBarController
//
//  Created by Rave Bizz on 7/28/22.
//

import UIKit

class ViewController: UIViewController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("view load")
        tabBarController?.delegate = self
//        UITabBarController
    }
    override func viewWillAppear(_ animated: Bool) {
        print("appear")
    }

}


