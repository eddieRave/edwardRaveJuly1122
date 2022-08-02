//
//  QRViewController.swift
//  QRCode
//
//  Created by Joel Maldonado on 8/1/22.
//

import UIKit

protocol QRGettable {
    func generateQRData() -> UIImage?
}

class QRViewController: UIViewController {
    
    @IBOutlet weak var qrImage: UIImageView!
    var qrGetter: QRGettable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        qrGetter = navigationController?.viewControllers[0] as? ViewController
        
//        updateCodeAsync()
        updateCodeSync()
    }
    
    func updateCodeAsync() {
        let startDate = Date()
        var generatedImage: UIImage?
        
        DispatchQueue.global().async {
            print("Start image processing")
            generatedImage = self.qrGetter?.generateQRData()
            print("Finish image processing")
            DispatchQueue.main.async {
                if let generatedImage = generatedImage {
                    print("Start image update")
                    self.qrImage.image = generatedImage
                }
            }
        }
        
        let elapsedTime = getElapsedTime(startDate)
        print("Async Elapsed Time: \(elapsedTime) seconds")
    }
    
    func updateCodeSync() {
        let startDate = Date()
        var generatedImage: UIImage?
        
        DispatchQueue.global().sync {
            print("Start image processing")
            generatedImage = self.qrGetter?.generateQRData()
            print("Finish image processing")
            DispatchQueue.main.async {
                if let generatedImage = generatedImage {
                    print("Start image update")
                    self.qrImage.image = generatedImage
                }
            }
        }
        
        let elapsedTime = getElapsedTime(startDate)
        print("Sync Elapsed Time: \(elapsedTime) seconds")
    }
    
    func getElapsedTime(_ startDate: Date) -> TimeInterval {
        let endTime = Date()
        return endTime.timeIntervalSince(startDate)
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
