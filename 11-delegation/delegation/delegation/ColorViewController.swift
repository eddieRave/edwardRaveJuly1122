//
//  ColorViewController.swift
//  delegation
//
//  Created by Rave Bizz on 7/19/22.
//

import Foundation
import UIKit

class ColorViewController: UIViewController{
    
    var delegate: ColorChangeAble? = nil
    
    @IBAction func pinkButton(_ sender: Any) {
        delegate?.changeColor(color: .systemPink)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func greenButton(_ sender: Any) {
        delegate?.changeColor(color: .systemGreen)
        self.dismiss(animated: true, completion: nil)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
