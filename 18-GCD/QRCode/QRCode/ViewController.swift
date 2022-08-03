//
//  ViewController.swift
//  QRCode
//
//  Created by Rave Bizz 41 on 8/1/22.
//

import UIKit

class QRInputViewController: UIViewController {

    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var loremText: UITextView!
    
    var myImage: UIImage!
    
    @IBAction func generateAction(_ sender: UIButton) {
        let myName = userInput.text
        let lorem = loremText.text ?? "empty"
        if let name = myName {
            let combinedString = name + lorem
            myImage = generateQRCode(from: combinedString)
     }
   }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Asynchronous call
        //updateCodeAsync()
        
        // Synchronous call
        updateCodeSync()
    }
        
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let qrVC = segue.destination as? QROutputViewController {
            qrVC.imageResult = myImage
        }
    }
    
    func generateQRCode(from input: String) -> UIImage? {
            let data = input.data(using: String.Encoding.ascii)

            if let filter = CIFilter(name: "CIQRCodeGenerator") {
                filter.setValue(data, forKey: "inputMessage")
                let transform = CGAffineTransform(scaleX: 3, y: 3)
                if let output = filter.outputImage?.transformed(by: transform) {
                    return UIImage(ciImage: output)
                }
            }
            return nil
    }

    // --------------------------
    // Async functions
    // --------------------------

    func updateCodeAsync() {
        let startDate = Date()
        print("start image processing")
        print("finish image processing")
        print("start image update")
        printElapsedTimeAsync(date: startDate)
    }
    
    func printElapsedTimeAsync(date: Date) {
        let endTime = Date()
        let elapsedTime = endTime.timeIntervalSince(date)
        print("async elapsed time:", elapsedTime, "seconds")
    }
    
    // --------------------------
    // Sync functions
    // --------------------------
    func updateCodeSync() {
        let startDate = Date()
        print("start image processing")
        print("finish image processing")
        print("start image update")
        printElapsedTimeSync(date: startDate)
    }
    
    func printElapsedTimeSync(date: Date) {
        let endTime = Date()
        let elapsedTime = endTime.timeIntervalSince(date)
        print("sync elapsed time:", elapsedTime, "seconds")
    }

} // end of class




