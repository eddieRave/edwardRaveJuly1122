//
//  SecondViewController.swift
//  review2
//
//  Created by Rave Bizz on 8/5/22.
//

import UIKit

protocol CallThisAble {
    func callThis()
}

class SecondViewController: UIViewController {
    
    var delegate: CallThisAble?

    @IBAction func handleSecondButton(_ sender: UIButton) {
        print("second button tapped")
        let sb = UIStoryboard(name: VCConstant.Third.rawValue, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: VCConstant.TabBar.rawValue)
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        ViewController().callThis()
        (navigationController?.viewControllers[0] as? ViewController)?.callThis()
        delegate?.callThis()
    }
    
// Does not hit this func
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        print("segue from second to third vc")
//    }
}
