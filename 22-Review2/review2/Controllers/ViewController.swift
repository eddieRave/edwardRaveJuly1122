//
//  ViewController.swift
//  review2
//
//  Created by Rave Bizz on 8/5/22.
//

import UIKit

/// review:
/// delegate
/// completions
/// generics
/// programmatic constraints
/// navigation flow
/// multiple storyboards

class ViewController: UIViewController {
    
    let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.start()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue.destination as? SecondViewController)?.delegate = self
    }

}

extension ViewController: CallThisAble {
    func callThis() {
        print("success")
    }
    
}
