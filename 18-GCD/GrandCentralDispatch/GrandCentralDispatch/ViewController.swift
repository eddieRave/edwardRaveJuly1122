//
//  ViewController.swift
//  GrandCentralDispatch
//
//  Created by Rave Bizz on 8/1/22.
//

/**
 ## GCD

 ### DispatchQueue.main
 - UI only
 - serial Queue, FIFO
 - only 1 main queue exists
     
 ### DispatchQueue.global()
 - qos
 - concurrent queue, enqueued tasks can finished in any order
 - creating custom queues

 ### Sync vs Async
 - sync waits for the current execution until the sync code returns
 - async code returns immediately after it enqueues the code to be executed, the code will be executed later

 ### Dispatch Groups
 - coordinating multiple async calls
 */

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var generatedQrLabel1: UIImageView!
    @IBOutlet weak var generatedQrLabel2: UIImageView!
    @IBOutlet weak var loremIpsumOutlet: UITextView!
    @IBOutlet weak var usernameOutlet: UITextField!
    
    @IBAction func createQrCodeAction(_ sender: UIButton) {
//        let qr = generateQRcode(input: username)
//        generatedQrLabel?.image = qr
    }
    
    lazy var username: String = usernameOutlet?.text ?? ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Call functions here
    }
    
    // This code runs when the "createQrCodeAction" button is pressed,
    // navigating me from the input screen to the QR screen
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.updateCodeAsync()
            let textForQR = self.username + (self.loremIpsumOutlet?.text ?? "")
            self.generatedQrLabel1?.image = self.generateQRcode(input: textForQR)
        }
        DispatchQueue.global().sync {
            updateCodeSync()
            generatedQrLabel2?.image = generateQRcode(input: username)
        }
    }
    
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let firstVC = segue.destination as? ViewController else { return }
        firstVC.username = usernameOutlet.text ?? ""
    }
    
    func updateCodeAsync() {
        let startDate = Date()
        print("start image processing")
        print("finish image processing")
        print("start image update")
        printElapedTimeAsync(date: startDate)
    }
    
    func printElapedTimeAsync(date: Date) {
        let endTime = Date()
        let elapsedTme = endTime.timeIntervalSince(date)
        print("async elapsed time:", elapsedTme, "seconds")
    }
    
    func updateCodeSync() {
        let startDate = Date()
        print("start image processing")
        print("finish image processing")
        print("start image update")
        printElapedTimeSync(date: startDate)
    }
    
    func printElapedTimeSync(date: Date) {
        let endTime = Date()
        let elapsedTme = endTime.timeIntervalSince(date)
        print("sync elapsed time:", elapsedTme, "seconds")
    }
    
}

/**
 Tutorial on generating QR codes:
    - https://medium.com/codex/qr-codes-are-simple-in-swift-6d203ebc3f5b
 */
