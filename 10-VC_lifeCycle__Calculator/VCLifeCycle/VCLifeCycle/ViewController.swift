//
//  ViewController.swift
//  VCLifeCycle
//
//  Created by Rave Bizz on 7/19/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(myButton.frame)
        configureButton()
    }
    func configureButton(){
        myButton.addTarget(self, action: #selector(navigate), for: .touchUpInside)
    }
    @objc func navigate(){
        let vc = (storyboard?.instantiateViewController(withIdentifier: "2VC"))!
        self.present(vc, animated: true, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        print("will apear")
    }
    override func viewWillLayoutSubviews() {
        print("layout subs")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("did appear")
        print(myButton.frame)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        print("screen changed")
        print(size)
    }

}

