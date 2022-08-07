//
//  ViewController.swift
//  generics
//
//  Created by Rave Bizz on 8/3/22.
//

import UIKit

class ViewController: UIViewController {
    var weaopns: [Weapon] = []{
        didSet{
            print(weaopns)
        }
    }
    var armor: [ArmorSet] = []{
        didSet{
            print(armor)
        }
    }
    
    struct Model<T>{
        let mysteries: T
        let word: String
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Network().getData(url: Constants.armorUrl, completion: {
            armorSets in
            self.armor = armorSets
        })
        Model(mysteries: "yes", word: "yes")
    }
    
    func makeArray<T>(inputOne: T, InputTwo: T) -> [T]{
        return [inputOne, InputTwo]
    }
    
    func compare<T: Comparable>(inputOne: T, InputTwo: T){
        print(inputOne < InputTwo)
    }
}

