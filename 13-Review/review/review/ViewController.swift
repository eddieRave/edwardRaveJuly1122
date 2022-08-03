//
//  ViewController.swift
//  review
//
//  Created by Rave Bizz on 7/22/22.
//

import UIKit

class ViewController: UIViewController {

    var label = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        view.addSubview(label)
        label.frame = view.bounds
        label.textAlignment = .center
        updateLabelClosure = { [weak self] text in
            self?.label.text = text
        }
        nestedClosure(completion: myAddOne)
        reducing()
        getRequest { myError in
            switch myError {
            case .statusCode(let statusCode):
                print("asdf \(statusCode)")
            case .emptyData:
                print("asdf")
            case .networkError:
                print("asdf")
            case .chickenDinner:
                print("asdf")
            }
        }
    }
    
    var updateLabelClosure: (String) -> Void = {_ in}
    
    var myAddOne: (Int) -> Int = { element in
        return element + 1
    }
    /// 1. Closures
    func closure() {
        let result = [1,2,3,4].map(myAddOne)
        print(result)
        
    }
    
    func nestedClosure(completion: (Int) -> Int) {
        let result = [1,2,3,4].map(completion)
        print(result)
        updateLabelClosure(result.description)
    }
    
    func reducing() {
        let arr = [1,2,3,4]
        let result = arr.reduce(0, { result, element in result + element })
        let resultTwo = arr.reduce(0) { result, element in
            result + element
        }
        let resultThree = arr
            .map { $0 + 1 }
            .reduce(0) { $0 + $1 }
        print(result, resultTwo, resultThree)
    }
    
    /// 2. Memory Management
    /// Memory Leak / Strong reference cycle: often occurs in closures that captures self
    //ViewController owns the updateLabelClosure
    //updateLabelClosure owns self/ViewController
    func escapingClosure(completion: @escaping () -> Void) {
        myEscapedClosure = completion
    }

    var myEscapedClosure: () -> Void = {}
    
    /// 3. URLSession
    func getRequest(completion: @escaping (MyNetworkError) -> Void) {
        /// URL dataTask completion is always on the background/global thread
        let task = URLSession.shared.dataTask(with: URL(string: "https://www.google.com")!) { data, response, error in
            guard error == nil else {
                print("network error \(error.debugDescription)")
                completion(.networkError)
                return
            }
            guard
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 else {
                print("status code error")
                completion(.statusCode((response as! HTTPURLResponse).statusCode))
                return
            }
            
            guard let data = data else {
                print("data error")
                completion(MyNetworkError.emptyData)
                return
            }
            
            print("data \(data)")
            DispatchQueue.main.async {
                self.label.text = data.description // needs to be on the main thread
            }
        }
            
        
        task.resume()
    }
    
    
}

/// 4. Enums, associated value
enum MyNetworkError: Error {
    case statusCode(Int)
    case emptyData
    case networkError
    case chickenDinner
}

/// 5. Autolayout
