//
//  Tester+Optionals.swift
//  SetDictionaryProject
//
//  Created by Luat on 12/10/21.
//

import Foundation

extension Tester {
    /// Optionals
    /// Unwrap using optional binding: if let
    /// else return 0
    func unwrap(optional: Int?) -> Int {
        if let num = optional {
            return num
        }
        return 0
    }
    
    /// Unwrap using optional binding: guard let
    /// else return ""
    func unwrap(optional: String?) -> String {
        guard let string = optional else {
            return ""
        }
        return string
    }
    
    /// Unwrap using nil coalescing
    /// takes optional array, return first value?
    func unwrap(optional: [Int]?) -> Int {
        return optional?.first ?? 0
    }
    
    /// Create a url from a string address, avoid force unwrapping
    /// else return the main bundle url
    func createURL(from address: String?) -> URL {
        return URL(string: address ?? "") ?? Bundle.main.bundleURL
    }
    
    
    /// Input array of [Int?], unwrap each Int? and return the an array of Int
    /// Input [Int?] = [1, nil, nil, 2] -> [1, 2]
    func unwrapElementsInArray(array: [Int?]) -> [Int] {
        var unwrappedArray: [Int] = []
        for num in array {
            let unwrappedNum = num ?? 0
            unwrappedArray.append(unwrappedNum)
        }
        return unwrappedArray
    }
    
    /// Unwrap using nil coalescing
    /// takes optional dictionary, return value at key?
    func unwrap(optional: [Int: Int]?, key: Int?) -> Int {
        let unwrappedKey = key ?? 0
        let dictOfIntegers: [Int: Int] = optional ?? [0:0]
        return dictOfIntegers[unwrappedKey] ?? 0
    }
    
    /// Unwrap using optional chaining and optional binding
    /// takes nested optional array, return first value?
    func unwrap(optional: [[Int]?]?) -> Int {
        let nestedArray: [[Int]?]? = optional
        return nestedArray?[0]?[0] ?? 0
    }
//    //1. optioning binding
//    //if let
//    if let firstNum = array.first{
//        firstNum + 1
//    }
//    //guard let
//    func add(){
//        guard let firstNum = array.first else
//        {
//            return
//        }
//        firstNum + 1
//    }
//    // nil coalescing
//    (array.first ?? 0) + 1
//
//    // optional chaining
//    var optArray: [Int]? = nil
//    //cant set non optional values to nil
//    //let arr: [Int] = nil
//    optArray?.count
//    optArray = [1,2,3]
//    optArray?.count
//    var nestArray: [[Int]?]? = nil
//    nestArray?[0]?[0]
    
    /// Unwrap using implicitly unwrap
    func implicitUnwrap(optional: Int?) -> Int {
        var num: Int!
        num = optional
        return num
    }
    
    /// Cast string into non-optional Int
    func castStringIntoInt(string: String) -> Int {
        let num = Int(string ) ?? 0
        return num
    }
    
    /// Cast an array of string into an array of Int, remove any nil values
    /// ["1", "5", "apple", "2"] --> [1, 5, 2]
    func castArray(from strArr: [String]) -> [Int] {
        let copyOfArray = strArr
        var convertedArray: [Int] = []
        for string in copyOfArray {
            let num = Int(string ) ?? 0
            if (num != 0) {
                convertedArray.append(num)
            }
        }
        return convertedArray
    }
}
