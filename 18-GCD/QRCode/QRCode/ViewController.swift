//
//  ViewController.swift
//  QRCode
//
//  Created by Joel Maldonado on 8/1/22.
//

import UIKit

class ViewController: UIViewController, QRGettable{

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func generateQRData() -> UIImage? {
        let qrString = "\(self.username.text ?? "") \(self.textView.text ?? "")"
        let data = qrString.data(using: String.Encoding.ascii)
        if let qrFilter = CIFilter(name: "CIQRCodeGenerator") {
            qrFilter.setValue(data, forKey: "inputMessage")
            if let ciImage = qrFilter.outputImage {
                return UIImage(ciImage: ciImage)
            }
        }
        
        return nil
    }
}

