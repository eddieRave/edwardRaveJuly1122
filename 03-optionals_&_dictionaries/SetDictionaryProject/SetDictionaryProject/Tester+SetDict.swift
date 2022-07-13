//
//  Tester.swift
//  SetDictionaryProject
//
//  Created by Luat on 8/4/21.
//

import Foundation

struct Tester {
    /// Remove an array with the duplicated values removed
    /// DONE
    func removeDups(nums: [Int]) -> [Int] {
        return Array(Set(nums))
    }
    
    /// Find the nums that exist in both arrays
    /// DONE
    func findCommonNums(from firstNums: [Int], and secondNums: [Int]) -> [Int] {
        let set1 = Set(firstNums)
        let set2 = Set(secondNums)
        
        // Intersection on set1 and set2
        return Array(set1.intersection(set2))
    }
    
    /// first: "hello", second: "bye" -> ["e"]
    /// DONE
    func findMatchingLetters(firstWord: String, secondWord: String) -> [Character] {
        // Create 2 sets of letters for both given words
        let set1 = Set(firstWord)
        let set2 = Set(secondWord)
        
        // Intersection on set1 and set2
        return Array(set1.intersection(set2))
    }
    
    
    /// Create a dictionary of the counts of the letters, ignoring spaces
    ///  DONE
    func createCounter(string: String) -> [Character: Int] {
        var dict = [Character: Int]()
        
        // Make set of characters from String
        let set = Set(string)
        
        // Loop through set
        for item in set {
            let charCount = string.filter({$0 == item}).count
            dict[item] = charCount
        }
        dict.removeValue(forKey: " ")
        
        return dict
    }
    
    /// Find most frequent letter in string: "hello there" -> "e"
    ///  DONE
    func mostFrequentLetter(string: String) -> Character {
        // Get set of letters from string
        var max : Character = "a"
        
        // Used to find the character with the highest occurence in string
        var maxCount = 0
        
        // Make a set of letters from the string
        let set = Set(string)
        
        // Loop through set
        for item in set {
            let current = string.filter({$0 == item}).count
            if (current > maxCount) {
                maxCount = current
                max = item
            }
        }
        
        return max
    }
    
    /// Given a string of numbers: "121" and a sentence "fire water fire"
    /// Determine if the sequence can be translated to the sentence exactly, if each number represents only one word
    /// "121" and a sentence "fire water fire" (returns true)
    /// "1122" and a sentence "fire water fire water" (returns false)
    /// "11221" and a sentence "fire fire water water fire" (returns true)
    /// DONE
    func translateNums(sequence: String, sentence: String) -> Bool {
       
        // Turn sentence into an array of words
        let arr = sentence.split(separator: " ")
        
        // Make empty sentence string
        var newSentence = ""
        
        // Loop through arr
        for i in arr {
            if i == "fire" {
                newSentence.append("1")
            } else if i == "water" {
                newSentence.append("2")
            }
        }
        
        // Compare newSentence with sequence
        if newSentence == sequence {
            return true
        }
        return false
    }
    
    /// Find number of pairs that SUMS up to 0
    /// O(n) time: don't use nested for loops
    func findPairsOfOpposites(nums: [Int]) -> Int {
        var dict: [Int: Int] = [:]
        var result = 0
        
        for i in nums {
            if dict[0 - i] != nil {
                result += 1
            } else {
                dict[0 + i] = i
            }
        }
        
        return result
    }
    
    /**
     Using Dictionary:
     Input: array of integers: [1, 4, 8, 1] with 1 having the highest priority.
     Output: reduce the distance bettwen priorities but keep the same priority ordering
     [1, 4, 8, 1] -> [1, 2, 3, 1]
     
        DONE
     */
    func reduceDistanceKeepPriority(array: [Int]) -> [Int] {
        // Make set from array
        let set = Set(array)
        let sortedSet = set.sorted()
        
        // Make a dictionary
        var dict = [Int:Int]()
        var num = 1
        sortedSet.forEach { ele in
            dict[ele] = num
            num += 1
        }
        
        // Create empty int array
        var arr = [Int]()
        
        // Fill arr
        for i in array {
            for (key, value) in dict {
                if i == key {
                    arr.append(value)
                }
            }
        }
        
        return arr
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
        // Make a dictionary
        let romanNumerals: [Character: Int] = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000
        ]
        
        var result = 0
        var temp: Character = "I"
        
        let reversed = roman.reversed()
        
        for(i, letter) in reversed.enumerated() {
            if i == 0 {
                result += romanNumerals[letter, default: 0]
                temp = letter
            } else if romanNumerals[letter] ?? 0 >= romanNumerals[temp] ?? 0 {
                result += romanNumerals[letter, default: 0]
                temp = letter
            } else if romanNumerals[letter] ?? 0 < romanNumerals[temp] ?? 0 {
                result -= romanNumerals[letter, default: 0]
                temp = letter
            }
        }
        
        return result
    }
    
}
