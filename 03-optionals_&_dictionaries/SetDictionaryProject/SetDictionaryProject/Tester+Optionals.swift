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
    ///
    func unwrap(optional: Int?) -> Int {
        if let num = optional {
            return num
        }
        return 0
    }
    
    /// Unwrap using optional binding: guard let
    /// else return ""
    func unwrap(optional: String?) -> String {
        guard let words = optional else {
            return ""
        }
        return words
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
        var returnArr: [Int] = []
        
        for element in array {
            if let element = element {
                returnArr.append(element)
            }
        }
        
        return returnArr
    }
    
    /// Unwrap using nil coalescing
    /// takes optional dictionary, return value at key?
    func unwrap(optional: [Int: Int]?, key: Int?) -> Int {
        
        return optional?[key ?? 0] ?? 0
    }
    
    /// Unwrap using optional chaining and optional binding
    /// takes nested optional array, return first value?
    func unwrap(optional: [[Int]?]?) -> Int {
        return optional?.first??.first ?? 0
    }
    
    /// Unwrap using implicitly unwrap
    func implicitUnwrap(optional: Int?) -> Int {
        var num: Int!
        num = optional
        
        return num
    }
    
    /// Cast string into non-optional Int
    func castStringIntoInt(string: String) -> Int {
        return Int(string) ?? 0
    }
    
    ///
    /// Cast an array of string into an array of Int, remove any nil values
    /// ["1", "5", "apple", "2"] --> [1, 5, 2]
    func castArray(from strArr: [String]) -> [Int] {
        var newArr: [Int] = []
        
        for element in strArr {
            if let int = Int(element) {
                newArr.append(int)
            }
        }
        
        return newArr
    }
}
