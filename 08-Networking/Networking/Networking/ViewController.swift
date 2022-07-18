//
//  ViewController.swift
//  Networking
//
//  Created by Rave Bizz on 7/18/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var jokeLabel: UILabel!
//    var labelText: String = ""{
//        didSet{
//            
//        }
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIManager.shared.fetchData() {
            data in
            if let text = data.contents?.jokes?.first?.joke?.text{
                DispatchQueue.main.async {
                    self.jokeLabel.text = text
                }
                
            }
        }
        // Do any additional setup after loading the view.
    }


}

