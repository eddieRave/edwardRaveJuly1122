//
//  AppDelegate.swift
//  addCreditCard
//
//  Created by Luat on 2/10/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
}
    
    
//    // Attempt 3
//    var window: UIWindow?
//    func applicationDidEnterBackground(_ application: UIApplication) {
//        let imageView = UIImageView(frame: self.window!.bounds)
//        imageView.tag = 1001
//        imageView.image = UIImage(named: "red.png") //your image goes here
//        UIApplication.shared.keyWindow?.subviews.last?.addSubview(imageView)
//    }
//    func applicationWillEnterForeground(_ application: UIApplication) {
//        if let imageView : UIImageView = UIApplication.shared.keyWindow?.subviews.last?.viewWithTag(1001) as? UIImageView {
//            imageView.removeFromSuperview()
//        }
//    }
    
    
//    // Attempt 4
//    func applicationWillResignActive(_ application: UIApplication) {
//        // Change the view to show what you want here.
//
//    }
    
    
//    // Attempt 5
//    var window: UIWindow?
//    private var appCoverWindow: UIWindow?
//    private var appCoverVC: UIViewController?
//    func applicationDidBecomeActive(_ application: UIApplication) {
//        if appCoverWindow != nil {
//            appCoverWindow!.isHidden = true
//            appCoverWindow!.rootViewController = nil
//            appCoverWindow = nil
//            appCoverVC = nil
//        }
//    }
//    func applicationWillResignActive(_ application: UIApplication) {
//        appCoverVC = SensitiveInfoViewController().storyboard!.instantiateViewController(withIdentifier: "AppCoverVCId") as! HiddenCoverViewController
//        appCoverWindow = UIWindow(frame: UIScreen.main.bounds)
//        let existingTopWindow = UIApplication.shared.windows.last
//        appCoverWindow!.windowLevel = existingTopWindow!.windowLevel + 1
//        appCoverVC!.view.frame = appCoverWindow!.bounds
//        appCoverWindow!.rootViewController = appCoverVC!
//        appCoverWindow!.makeKeyAndVisible()
//    }
//    class func appLaunchImage() -> UIImage? {
//        //this method will return LaunchImage
//        let launchImageNames = Bundle.main.paths(forResourcesOfType: "png", inDirectory: nil).filter { (imageName) -> Bool in
//            return imageName.contains("red")
//        }
//        for imageName in launchImageNames {
//            guard let image = UIImage(named: imageName) else { continue }
//
//            // if the image has the same scale and dimensions as the current device's screen...
//            if (image.scale == UIScreen.main.scale) && (image.size.equalTo(UIScreen.main.bounds.size)) {
//                return image
//            }
//        }
//        return nil
//    }
    
    
//    // Attempt 6
//    var coverView: CoverView?
//    func applicationDidEnterBackground(_ application: UIApplication) {
//        coverView = CoverView()
//        coverView!.frame = window!.frame
//        window?.addSubview(coverView!)
//    }
//    func applicationDidBecomeActive(_ application: UIApplication) {
//        coverView?.removeFromSuperview()
//        coverView = nil
//    }
    
    
//    // Attempt 7
//    var window: UIWindow?
//    var appSwitcherView: UIView?
//    func applicationWillResignActive(_ application: UIApplication) {
//        // First apply the Gaussian blur on the screenshot of the current view.
//        let blurredImage = applyGaussianBlur(on: createScreenshotOfCurrentContext() ?? UIImage(), withBlurFactor: 4.5)
//        // Create the UIImageView for the blurred screenshot.
//        appSwitcherView = UIImageView(image: blurredImage)
//        // Set it as the current screen
//        self.window?.addSubview(appSwitcherView!)
//    }
//    func applicationDidBecomeActive(_ application: UIApplication) {
//        appSwitcherView?.removeFromSuperview()
//    }
//    /// This method takes a screenshot of the currently shown view.
//    /// Method returns nil if screenshot can't be taken.
//    func createScreenshotOfCurrentContext() -> UIImage? {
//        UIGraphicsBeginImageContext(self.window?.screen.bounds.size ?? CGSize())
//        guard let currentContext = UIGraphicsGetCurrentContext() else {
//            return nil
//        }
//
//        self.window?.layer.render(in: currentContext)
//
//        let image = UIGraphicsGetImageFromCurrentImageContext()
//
//        UIGraphicsEndImageContext()
//
//        return image
//    }
//    /// This method applies a Gaussian blur on a given UIImage.
//    /// - Parameters:
//    ///   - image: The image where the Gaussian blur will be applied on
//    ///   - blurFactor: How high should the blur effect be
//    func applyGaussianBlur(on image: UIImage, withBlurFactor blurFactor : CGFloat) -> UIImage? {
//        guard let inputImage = CIImage(image: image) else {
//            return nil
//        }
//
//        // Add a comment where to find documentation for that
//        let gaussianFilter = CIFilter(name: "CIGaussianBlur")
//            gaussianFilter?.setValue(inputImage, forKey: kCIInputImageKey)
//            gaussianFilter?.setValue(blurFactor, forKey: kCIInputRadiusKey)
//
//        guard let outputImage = gaussianFilter?.outputImage else {
//            return nil
//        }
//
//        return UIImage(ciImage: outputImage)
//    }
