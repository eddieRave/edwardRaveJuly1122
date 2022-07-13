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
    /// DONE
    func unwrap(optional: Int?) -> Int {
        
        if let optional = optional {
            return optional
        } else {
        return 0
        }
        
    }
    
    /// Unwrap using optional binding: guard let
    /// else return ""
    /// DONE
    func unwrap(optional: String?) -> String {
        guard let myString = optional else {
            return ""
        }
        return myString
        
    }
    
    /// Unwrap using nil coalescing
    /// takes optional array, return first value?
    /// DONE
    func unwrap(optional: [Int]?) -> Int {
        return optional?.first ?? 0
    }
    
    /// Create a url from a string address, avoid force unwrapping
    /// else return the main bundle url
    /// DONE
    func createURL(from address: String?) -> URL {
        return URL(string: address ?? "Bundle.main.BundleURL") ?? Bundle.main.bundleURL
    }
    
    
    /// Input array of [Int?], unwrap each Int? and return the an array of Int
    /// Input [Int?] = [1, nil, nil, 2] -> [1, 2]
    /// DONE
    func unwrapElementsInArray(array: [Int?]) -> [Int] {
        return array.compactMap{($0)}
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
    /// DONE
    func implicitUnwrap(optional: Int?) -> Int {
        return optional!
    }
    
    /// Cast string into non-optional Int
    /// DONE
    func castStringIntoInt(string: String) -> Int {
        return Int(string)!
    }
    
    /// Cast an array of string into an array of Int, remove any nil values
    /// ["1", "5", "apple", "2"] --> [1, 5, 2]
    /// DONE
    func castArray(from strArr: [String]) -> [Int] {
        let arr: [Int] = strArr.compactMap{Int($0)}
        return arr
    }
}
