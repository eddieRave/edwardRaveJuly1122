//
//  QRController.swift
//  QRCodeSB
//
//  Created by Kevin McKenney on 8/1/22.
//

import Foundation
import UIKit

class QRController: UIViewController {
    

    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var quoteLabel: UILabel!
    
    var clickedSync = false
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let imageController = segue.destination as? ImageController else { return }
        var combinedInput = usernameInput.text ?? ""; combinedInput += quoteLabel.text ?? ""
        imageController.codeGeneratorString = combinedInput
        if let button = sender as? UIButton {
            imageController.isAsync = (button.tag == 0)
        }
    }
}

