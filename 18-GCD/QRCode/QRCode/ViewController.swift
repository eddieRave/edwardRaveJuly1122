//
//  ViewController.swift
//  QRCode
//
//  Created by Rave Bizz 63 on 8/1/22.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Presenting the QR screen modally so it is technically
    // the same view controller. Please let me know if this is okay
    // or if it should be two seperate controllers in the future
    override func viewDidAppear(_ animated: Bool) {
        updateQRCode()
    }
    
    @IBOutlet weak var loremLabel: UILabel!
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var qrImageView: UIImageView!
    
    @IBAction func createQRCode(_ sender: Any) {
    }
    
    //    lazy var userText: String = userInput?.text ?? ""
    //    lazy var loremText: String = loremLabel?.text ?? ""
    //    lazy var qrInput: String = "\(userText) \n \(loremText)"
    lazy var qrInput: String = "\((loremLabel?.text ?? "")) \n \((userInput?.text ?? ""))"
    //    I don't know which way for the above is cleaner
    
    
    //    Found this block of code through research/YouTube
    func generateQRcode(input: String) -> UIImage? {
        let data = input.data(using: String.Encoding.ascii)
        if let qrFilter = CIFilter(name: "CIQRCodeGenerator") {
            qrFilter.setValue(data, forKey: "inputMessage")
            guard let qrImage = qrFilter.outputImage else {
                return nil
            }
            return UIImage(ciImage: qrImage)
        }
        return nil
    }
    
    func generateQRSync(){
        DispatchQueue.global().sync {
            let QRimage = generateQRcode(input: qrInput)
            qrImageView?.image = QRimage
        }
    }
    
    func generateQRAsync(){
        DispatchQueue.global().sync {
            let QRimage = generateQRcode(input: qrInput)
            qrImageView?.image = QRimage
        }
    }
    
    func updateQRCode() {
        let startDate = Date()
        print("start image processing")
        generateQRSync() // Replace this with generateQRAsync for alternate results
        // The other way around this would be to show two seperate QR codes or have
        // two seperate create buttons on the account page.
        print("finish image processing")
        print("start image update")
        printElapsedTime (date: startDate)
    }
    
    func printElapsedTime (date: Date) {
        let endTime = Date()
        let elapsedTime = endTime.timeIntervalSince(date)
        print("Elapsed Time: \(elapsedTime) seconds")
    }
}

