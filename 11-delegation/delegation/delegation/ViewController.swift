//
//  ViewController.swift
//  delegation
//
//  Created by Rave Bizz on 7/19/22.
//

import UIKit

protocol ColorChangeAble{
    func changeColor(color: UIColor)
}

class ViewController: UIViewController, ColorChangeAble {
func changeColor(color: UIColor) {
        view.backgroundColor = color
}
    


   @IBAction func handleTap(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ColorVC") as? ColorViewController{
            vc.delegate = self
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

}

