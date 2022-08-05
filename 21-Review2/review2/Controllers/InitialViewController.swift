//
//  InitialViewController.swift
//  review2
//
//  Created by Rave Bizz on 8/5/22.
//

import UIKit

class InitialViewController: UIViewController {

    let topLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(topLabel)
        topLabel.translatesAutoresizingMaskIntoConstraints = false

        topLabel.text = "TOP LABEL"
        topLabel.backgroundColor = .yellow
        topLabel.textAlignment = .center
        
        topLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        topLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
//        view.trailingAnchor.constraint(equalTo: topLabel.trailingAnchor, constant: 20).isActive = true
        topLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    @IBAction func handleInitiaButton(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: VCConstant.NavCon.rawValue) else {
            return
        }
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
