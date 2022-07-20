//
//  ViewController.swift
//  DelegationExample
//
//  Created by Spencer Hurd on 7/20/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let shop = CookieShop()
        let bakery = Bakery()
        bakery.delegate = shop
        bakery.makeCookie()
    }
}

protocol BakeryDelegate {
    func cookieWasBaked(_ cookie: Cookie)
}

class CookieShop: BakeryDelegate {
    func cookieWasBaked(_ cookie: Cookie) {
        print("A new cookie was baked, with size \(cookie.size)")
    }
}

struct Cookie {
    var size:Int = 5
    var hasChocolateChips:Bool = false
}

class Bakery {
    var delegate: BakeryDelegate?
    func makeCookie() {
        var cookie = Cookie()
        cookie.size = 6
        cookie.hasChocolateChips = true
        delegate?.cookieWasBaked(cookie)
    }
}
