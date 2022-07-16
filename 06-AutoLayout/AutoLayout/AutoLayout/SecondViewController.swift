//
//  SecondViewController.swift
//  AutoLayout
//
//  Created by Spencer Hurd on 7/16/22.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var midButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func disappearMidButton(_ sender: UIButton) {
        midButton.isHidden = true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
