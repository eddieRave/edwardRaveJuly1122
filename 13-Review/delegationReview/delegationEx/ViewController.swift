//
//  ViewController.swift
//  delegationEx
//
//  Created by Rave Bizz on 7/20/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let coder = Coder()
        let assistant = Assistant()
        let gf = Girlfriend()
        let mock = DrinkGetterMock(drinkType: .tea(16))
        coder.assistant = mock
        coder.work()
    }

}

/* Advantages of Delegation
 1) Uncouples the Coder from the Assistant
 - Coder class should compile without Assistant Class
 2) Only give access to the func that the client class needs
 - Coder only has access to getCoffee() func and not other funcs on assistant
 3) Communication:
 - can pass info as parameters from Coder into Assistant class
 */
