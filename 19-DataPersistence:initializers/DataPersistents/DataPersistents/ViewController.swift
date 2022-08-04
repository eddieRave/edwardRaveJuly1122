//
//  ViewController.swift
//  DataPersistents
//
//  Created by Rave Bizz on 8/2/22.
//

import UIKit
// 1. UserDefaults
// used for small sets of data
// 2. FileManger
// 3. coreData
// power data base 
// 4. key chain
//sensative data

struct Car: Codable{
    let numWheels: Int
    let name: String
}


class ViewController: UIViewController {
    var numberOfLaunches: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
//        saveFile()
        getDefaults()
        setDefaults()
        getDefaults()
        saveFile()
        accessFile()
        // Do any additional setup after loading the view.
    }
    func setDefaults(){
        numberOfLaunches += 1
        UserDefaults.standard.set(numberOfLaunches, forKey: "numOfLaunches")
        
        
    }
    func getDefaults(){
        let num = UserDefaults.standard.integer(forKey: "numOfLaunches")
        numberOfLaunches = num
        print(num)
    }
    
    func saveFile(){
        let car = Car(numWheels: 4, name: "ford")
        let cacheDirectory = FileManager.SearchPathDirectory.cachesDirectory
        let folderURLs = FileManager.default.urls(for: cacheDirectory, in: .userDomainMask)
        print(folderURLs)
        guard let fileURL = folderURLs.first?.appendingPathComponent("cars") else { return }
        print(fileURL)
        guard let data = try? JSONEncoder().encode(car) else {
            return
        }
        try? data.write(to: fileURL, options: .atomicWrite)
    }
    
    func accessFile(){
        let cacheDirectory = FileManager.SearchPathDirectory.cachesDirectory
        let folderURLs = FileManager.default.urls(for: cacheDirectory, in: .userDomainMask)
        guard let fileURL = folderURLs.first?.appendingPathComponent("cars") else { fatalError() }
        
        guard let data = FileManager.default.contents(atPath: fileURL.path) else {
            fatalError()
        }
        if let car = try? JSONDecoder().decode(Car.self, from: data) {
            print(car)
        }
    }
}

