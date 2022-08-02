//
//  ViewController.swift
//  Will18
//
//  Created by WillC on 8/1/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.global().sync {
        }
       
    }

    @IBOutlet weak var QRImageView: UIImageView!
    @IBOutlet weak var textFeild: UITextField!
    @IBAction func updateText(_ sender: Any) {
        
    }
    override func viewDidAppear(_ animated: Bool) {
        updateCode()
    }
   lazy var inputText : String = textFeild?.text ?? "EMPTY"

    
    

    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)

        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 1, y: 0.5
            )

            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        return nil
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let firstVC = segue.destination as? ViewController else { return }
        firstVC.inputText = textFeild.text ?? "problem"
    }

    func makeQRAsync(){
        DispatchQueue.main.async { [self] in
            let QRimage = generateQRCode(from: inputText )
            QRImageView?.image = QRimage
        }

    }
    func makeQRSync(){
        DispatchQueue.global().sync {
            let QRimage = generateQRCode(from: inputText )
            QRImageView?.image = QRimage
        }
    }
    func updateCode() {
        let startDate = Date()
        print("start image processing")
//        makeQRSync()
        makeQRAsync()
        print("finish image processing")
        print("start image update")
        printElapsedTime (date: startDate)
    }
    
    func printElapsedTime (date: Date) {
        let endTime = Date()
        let elapsedTime = endTime.timeIntervalSince(date)
        print("async elapsed time:", elapsedTime,
        "seconds")
    }

}

