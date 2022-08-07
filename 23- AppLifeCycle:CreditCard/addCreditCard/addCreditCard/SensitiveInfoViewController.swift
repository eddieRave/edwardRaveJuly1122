//
//  ViewController.swift
//  addCreditCard
//
//  Created by Luat on 2/10/22.
//

import UIKit

class SensitiveInfoViewController: UIViewController {
    
    let notificationCenter = NotificationCenter.default
    
    var normalView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    let maskView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        normalView = view
        
        notificationCenter.addObserver(self, selector: #selector(active), name: UIApplication.didBecomeActiveNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(background), name: UIApplication.didEnterBackgroundNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(foreground), name: UIApplication.willEnterForegroundNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(inactive), name: UIApplication.willResignActiveNotification, object: nil)
    }
    
    @objc func foreground(){
        count += 1
        print("App is in foreground \(count)")
    }
    @objc func active(){
        print("App is active")
//        view.isHidden = false
        view.backgroundColor = .white
        view = normalView
    }
    @objc func inactive(){
        print("App is inactive")
//        view.isHidden = true
        maskView.backgroundColor = .red
        view = maskView
//        view.mask = maskView
    }
    @objc func background(){
        count += 1
        print("App is in background \(count)")
    }
    
}

// Tutorial used: https://www.hackingwithswift.com/example-code/uikit/how-to-mask-one-uiview-using-another-uiview
