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
        
        var result: [Int] = []
        
        for num in firstNums {
            if secondNums.contains(num) {
                result.append(num)
            }
        }
        return result
    }
    
    /// first: "hello", second: "bye" -> ["e"]
    func findMatchingLetters(firstWord: String, secondWord: String) -> [Character] {
        
        var result: [Character] = []
        
        for letter in firstWord {
            if secondWord.contains(letter) {
                result.append(letter)
            }
        }
        
        return result
    }
    
    
    /// Create a dictionary of the counts of the letters, ignoring spaces
    func createCounter(string: String) -> [Character: Int] {
        
        var dict: [ Character: Int] = [:]

        for letter in string {
            if letter == " " {
                continue
            } else if dict[letter] != nil {
                dict[letter, default: 0] += 1
            } else {
                dict[letter] = 1
            }
        }
        return dict
    }
    
    /// Find most frequent letter in string: "hello there" -> "e"
    func mostFrequentLetter(string: String) -> Character {
        
        var dict: [Character: Int] = [:]
        var result: Character = "N"
        
        for letter in string {
            if dict[letter] != nil {
                dict[letter]? += 1
            } else {
                dict[letter] = 1
            }
        }
        
        let max = dict.values.max()
        
        for (key, value) in dict {
            if value == max {
                result = key
            }
        }
        
        return result
    }
    
    /// Given a string of numbers: "121" and a sentence "fire water fire"
    /// Determine if the sequence can be translated to the sentence exactly, if each number represents only one word
    /// "121" and a sentence "fire water fire" (returns true)
    /// "1122" and a sentence "fire water fire water" (returns false)
    /// "11221" and a sentence "fire fire water water fire" (returns true)
    func translateNums(sequence: String, sentence: String) -> Bool {

        var dict: [Substring: Character] = [:]
        let array = sentence.split(separator: " ")
        var nums: [Character] = []
        
        for num in sequence {
            nums.append(num)
        }
        
        for (index, word) in array.enumerated() {
            if dict[word] != nil {
                continue
            } else {
                dict[word] = nums[index]
            }
        }
        
        for (index, word) in array.enumerated() {
            if dict[word] != nums[index] {
                return false
            }
        }
        
        return true
    }
    
    /// Find number of pairs that SUMS up to 0
    /// O(n) time: don't use nested for loops
    func findPairsOfOpposites(nums: [Int]) -> Int {
        
        var dict: [Int: Int] = [:]
        var result = 0
        
        for num in nums {
            if dict[0 - num] != nil {
                result += 1
            } else {
                dict[0 + num] = num
            }
        }
        
        return result
    }
    
    /**
     Using Dictionary:
     Input: array of integers: [1, 4, 8, 1] with 1 having the highest priority.
     Output: reduce the distance bettwen priorities but keep the same priority ordering
     [1, 4, 8, 1] -> [1, 2, 3, 1]
     */
    func reduceDistanceKeepPriority(array: [Int]) -> [Int] {
        
        var result: [Int] = []
        let sorted = array.sorted()
        var dict: [Int: Int] = [:]
        var count = 0
        
        for num in sorted {
            if dict[num] != nil {
                continue
            } else {
                dict[num] = count
                count += 1
            }
        }
        
        for int in array {
            result.append(dict[int, default: 0] + 1)
        }
        
        return result
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

        let dict: [Character: Int] = [
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

        for (index, letter) in reversed.enumerated() {

            if index == 0 {
                result += dict[letter, default: 0]
                temp = letter
            } else if dict[letter] ?? 0 >= dict[temp] ?? 0{
                result += dict[letter, default: 0]
                temp = letter
            } else if dict[letter] ?? 0 < dict[temp] ?? 0{
                result -= dict[letter, default: 0]
                temp = letter
            }
        }

        return result
    }
    
}
