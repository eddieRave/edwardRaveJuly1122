//
//  ViewController.swift
//  MVC-Demo
//
//  Created by Rave Bizz on 7/18/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var actibvityLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var getActivityButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        // Do any additional setup after loading the view.
    }
    
    func setUpUI(){
        hidingLabels()
        configureButton()
    }
    
    func configureButton(){
        getActivityButton.setTitle("bored?", for: .normal)
        getActivityButton.addTarget(self, action: #selector(getData), for: .touchUpInside)
    }
    @objc func getData(){
        NetworkManager.shared.getData(completion: {
            activity in
            
            DispatchQueue.main.async {
                if let activity = activity.activity{
                    self.actibvityLabel.text = activity
                    self.actibvityLabel.isHidden = false
                }
                if let genre = activity.formatType(){
                    self.typeLabel.text = genre
                    self.typeLabel.isHidden = false
                }else{
                    self.typeLabel.isHidden = true 
                }
            }
            
        })
    }
    func hidingLabels(){
        actibvityLabel.isHidden = true
        typeLabel.isHidden = true
    }

}

