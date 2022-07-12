//
//  ViewController.swift
//  String
//
//  Created by Luat on 8/2/21.
//

import UIKit

class ViewController: UIViewController {

    let tester = Tester.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let sample = tester.isPalindrome(word: "tacocat")
//        print(sample)
//        tester.printLetters(word: "hello world")
//        tester.printEvenIndexEnumerated(word: "hello world")
//        tester.printEvenIndexStride(word: "hello world")
        tester.printPigLatin(word: "nasty")
        tester.isPalindrome(word: "iioii")
//        tester.printPigLatin(word: "egg")
    }


}

