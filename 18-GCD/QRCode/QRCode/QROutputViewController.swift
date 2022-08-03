//
//  QROutputViewController.swift
//  QRCode
//
//  Created by Rave Bizz 41 on 8/2/22.
//

import UIKit

class QROutputViewController: UIViewController {

    @IBOutlet weak var qrImageView: UIImageView!
    
    var imageResult: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        qrImageView.image = imageResult
    }

}
