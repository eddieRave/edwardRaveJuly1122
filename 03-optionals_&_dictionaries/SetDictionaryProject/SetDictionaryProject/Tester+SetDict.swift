//
//  Tester.swift
//  SetDictionaryProject
//
//  Created by Luat on 8/4/21.
//

import Foundation

struct Tester {
    /// Remove an array with the duplicated values removed
    func removeDups(nums: [Int]) -> [Int] {
       return Array(Set(nums))
    }
    
    /// Find the nums that exist in both arrays
    func findCommonNums(from firstNums: [Int], and secondNums: [Int]) -> [Int] {
        var returnArr: [Int] = []
        for num in firstNums {
            if(secondNums.contains(num)) {
                returnArr.append(num)
            }
        }
        return returnArr
    }
    
    /// first: "hello", second: "bye" -> ["e"]
    func findMatchingLetters(firstWord: String, secondWord: String) -> [Character] {
        var returnArr: [Character] = []
        for letter in firstWord {
            if secondWord.contains(letter) {
                returnArr.append(letter)
            }
        }
        return returnArr
 }
    
    
    /// Create a dictionary of the counts of the letters, ignoring spaces
    func createCounter(string: String) -> [Character: Int] {
        var returnDict: [Character : Int] = [:]
        
        for letter in string {
            if(letter != " ") {
                var count = returnDict[letter] ?? 0
                count += 1
                returnDict[letter] = count
            }
        }
        return returnDict
    }
    
    /// Find most frequent letter in string: "hello there" -> "e"
    func mostFrequentLetter(string: String) -> Character {
        var dict: [Character: Int] = [:]
        
        for letter in string {
            if(letter != " ") {
                var count = dict[letter] ?? 0
                count += 1
                dict[letter] = count
            }
        }
        
        var count = 0
        var mostFrequentChar: Character = " "
        
        for (key, value) in dict {
            if value > count {
                count = value
                mostFrequentChar = key
            }
        }
        
        return mostFrequentChar
    }
    
    /// Given a string of numbers: "121" and a sentence "fire water fire"
    /// Determine if the sequence can be translated to the sentence exactly, if each number represents only one word
    /// "121" and a sentence "fire water fire" (returns true)
    /// "1122" and a sentence "fire water fire water" (returns false)
    /// "11221" and a sentence "fire fire water water fire" (returns true)
    func translateNums(sequence: String, sentence: String) -> Bool {
        let words = sentence.split(separator: " ")
        var dict: [Character: String] = [:]
        
        for i in stride(from: 0, to: sequence.count, by: 1) {
            let num = sequence[sequence.index(sequence.startIndex, offsetBy: i)]
            let word = String(words[i])
            
            switch dict[num] {
            case .some(let storedWord):
                if(storedWord != word) {
                    return false;
                }
                
            case .none:
                dict[num] = word
            }
        }
        
        return true
    }
    
    /// Find number of pairs that SUMS up to 0
    /// O(n) time: don't use nested for loops
    func findPairsOfOpposites(nums: [Int]) -> Int {
        var count = 0;
        var dict: [Int: Int] = [:]
        
        for i in 0 ..< nums.count {
            dict[nums[i]] = i
        }
        
        for i in 0 ..< nums.count {
            if(dict[0 - nums[i]] != nil) {
                count += 1
            }
        }
        
        return count / 2
    }
    
    /**
     Using Dictionary:
     Input: array of integers: [1, 4, 8, 1] with 1 having the highest priority.
     Output: reduce the distance bettwen priorities but keep the same priority ordering
     [1, 4, 8, 1] -> [1, 2, 3, 1]
     */
    func reduceDistanceKeepPriority(array: [Int]) -> [Int] {
        let intSet = Set(array)
        let orderedArr = intSet.sorted()
        var dict: [Int: Int] = [:]
        var returnArr: [Int] = []
        
        for i in 0 ..< orderedArr.count {
            dict[orderedArr[i]] = i + 1
        }
        
        for i in 0 ..< array.count {
            if let value = dict[array[i]] {
                returnArr.append(value)
            }
        }
        
        return returnArr
    }
    
    
    /*
     Convert roman numerals into integer
     I = 1
     V = 5
     X = 10
     L = 50
     C = 100
     D = 500
     M = 1000
     
     IV = 4, IX = 9
     XL = 40, XC = 400
     CD = 400, CM = 900
     */
    
    func romanToInt(roman: String) -> Int {
        var int = 0
        let dict: [Character: Int] = [
            "I" : 1,
            "V" : 5,
            "X" : 10,
            "L" : 50,
            "C" : 100,
            "D" : 500,
            "M" : 1000
        ]
        
        var i = 0
        
        while(i < roman.count) {
            let currentRoman = roman[roman.index(roman.startIndex, offsetBy: i)]
            let currentInt = dict[currentRoman] ?? 0

            if(i == roman.count - 1) {
                int += currentInt
                return int
            }
            
            let next = roman[roman.index(roman.startIndex, offsetBy: i + 1)]
            let nextInt = dict[next] ?? 0
            
        //
            if(currentInt >= nextInt) {
                int += currentInt
                i += 1
            } else {
                int += (nextInt - currentInt)
                i += 2
            }
        }
        
        return int
    }
    
}
