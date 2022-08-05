//
//  ViewController.swift
//  ApplicationLifeCycle
//
//  Created by Rave Bizz on 8/5/22.
//

import UIKit

class ViewController: UIViewController {
    //not running
    // active
    // inactive
    //background
    let button = UIButton()
    let notifactionCenter = NotificationCenter.default
    override func viewDidLoad() {
        super.viewDidLoad()
//        button.addTarget(self, action: #selector(handleButtonPress), for: .touchUpInside)
        
        notifactionCenter.addObserver(self, selector: #selector(active), name: UIApplication.didBecomeActiveNotification, object: nil)
        notifactionCenter.addObserver(self, selector: #selector(background), name: UIApplication.didEnterBackgroundNotification, object: nil)
        notifactionCenter.addObserver(self, selector: #selector(foreground), name: UIApplication.willEnterForegroundNotification, object: nil)
        notifactionCenter.addObserver(self, selector: #selector(resign), name: UIApplication.willResignActiveNotification, object: nil)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func foreground(){
        print("foreground")
    }
    
    @objc func active(){
        print("active")
    }

    @objc func resign(){
        print("inactive")
    }
    @objc func background(){
        print("background")
    }
    @objc func handleButtonPress(){
        print("button Pressed")
    }


}

