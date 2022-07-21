//
//  EntryViewController.swift
//  ToDoSb
//
//  Created by Kevin McKenney on 7/20/22.
//

import UIKit

class EntryViewController: UIViewController {
    
    
    @IBOutlet weak var label: UITextView!
    
    
    var dataEnteredDelegate: DataEnteredDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dataEnteredDelegate = navigationController?.viewControllers[0] as? DataEnteredDelegate
        
    }

    
    @IBAction func onClickEnter(_ sender: Any) {
        guard let delegate = dataEnteredDelegate  else { return }
        guard let label = label else { return }
    
        delegate.userDidEnterInformation(info: label.text)
    }
    
    
}

