//
//  ImageContoller.swift
//  QRCodeSB
//
//  Created by Kevin McKenney on 8/1/22.
//

import Foundation
import UIKit

class ImageController: UIViewController {
    
    @IBOutlet weak var qrCode: UIImageView!
    
    var codeGeneratorString: String?
    var isAsync = false
    
    override func viewDidAppear(_ animated: Bool) {
        updateCode()
    }
    func updateCode() {
        let startDate = Date()
    
        if isAsync {
            DispatchQueue.global().async {
                print("start image processing")
                let image = self.generateQRCode(from: self.codeGeneratorString ?? "")
                print("finish image processing")
                DispatchQueue.main.async {
                    print("start image update")
                    self.qrCode.image = image
                }
            }
        } else {
            print("start image processing")
            let image = self.generateQRCode(from: self.codeGeneratorString ?? "")
            print("finish image processing")
            print("start image update")
            self.qrCode.image = image
        }
        printElapsedTime (date: startDate)
    }
    
    func printElapsedTime(date: Date) {
        let endTime = Date()
        let elapsedTime = endTime.timeIntervalSince(date)
        let timing = isAsync ? "async" : "sync"
        print(timing + " elapsed time:", elapsedTime, "seconds")
    }
    
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        if let QRFilter = CIFilter(name: "CIQRCodeGenerator") {
            QRFilter.setValue(data, forKey: "inputMessage")
            guard let QRImage = QRFilter.outputImage else {return nil}
            return UIImage(ciImage: QRImage)
        }
        return nil
    }
}
