//
//  InputScreenViewController.swift
//  todoApp
//
//  Created by WillC on 7/21/22.
//

import UIKit

class InputScreenViewController: UIViewController {
    
    @IBOutlet weak var inputFromUser: UITextView!
    @IBOutlet weak var submitButton: UIButton!
    
    var  tD : textDelegate?
    override func viewDidLoad() {
        tD = navigationController?.viewControllers[0] as? textDelegate
        super.viewDidLoad()
    }
    @IBAction func submitButton(_ sender: Any) {
        tD?.sendText(text: inputFromUser.text)
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
