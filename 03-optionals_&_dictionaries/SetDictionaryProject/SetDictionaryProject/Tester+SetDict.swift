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
        Array(Set(nums))
    }
    
    /// Find the nums that exist in both arrays
    func findCommonNums(from firstNums: [Int], and secondNums: [Int]) -> [Int] {
        var commonNums: [Int] = []
        
        firstNums.forEach{
            if secondNums.contains($0) {
                commonNums.append($0)
            }
        }
        return commonNums
    }
    
    /// first: "hello", second: "bye" -> ["e"]
    func findMatchingLetters(firstWord: String, secondWord: String) -> [Character] {
        var commonLetters: [Character] = []
        
        firstWord.forEach{
            if secondWord.contains($0) {
                commonLetters.append($0)
            }
        }
        return commonLetters
    }
    
    
    /// Create a dictionary of the counts of the letters, ignoring spaces
    func createCounter(string: String) -> [Character: Int] {
        var counter: [Character: Int] = [:]
    
        string.forEach {
            if $0 != " " {
                counter[$0] = (counter[$0] ?? 0) + 1
            }
        }
        
        return counter
    }
    
    /// Find most frequent letter in string: "hello there" -> "e"
    func mostFrequentLetter(string: String) -> Character {
        createCounter(string: string).max(by: { $0.value < $1.value })!.key
    }
    
    /// Given a string of numbers: "121" and a sentence "fire water fire"
    /// Determine if the sequence can be translated to the sentence exactly, if each number represents only one word
    /// "121" and a sentence "fire water fire" (returns true)
    /// "1122" and a sentence "fire water fire water" (returns false)
    /// "11221" and a sentence "fire fire water water fire" (returns true)
    func translateNums(sequence: String, sentence: String) -> Bool {
        sentence.components(separatedBy: " ").map({ $0 == "fire" ? "1" : "2" }) == sequence.map({ $0 })
    }
    
    /// Find number of pairs that SUMS up to 0
    /// O(n) time: don't use nested for loops
    func findPairsOfOpposites(nums: [Int]) -> Int {
        var count = 0
        for (index, num) in nums.enumerated() {
            if nums.suffix(nums.count - index - 1).contains(where: { $0 + num == 0 }) { count += 1 }
        }
        
        return count
    }
    
    /**
     Using Dictionary:
     Input: array of integers: [1, 4, 8, 1] with 1 having the highest priority.
     Output: reduce the distance bettwen priorities but keep the same priority ordering
     [1, 4, 8, 1] -> [1, 2, 3, 1]
     */
    func reduceDistanceKeepPriority(array: [Int]) -> [Int] {
        array.map { Set(array).sorted().firstIndex(of: $0)! + 1 }
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
     XL = 40, XC = 90
     CD = 400, CM = 900
     */
    
    func romanToInt(roman: String) -> Int {
        var prevChar: Character = " "
        var int = 0
        
        roman.forEach {
            switch $0 {
            case "I":
                int += 1
            case "V":
                int += prevChar != "I" ? 5 : 3
            case "X":
                int += prevChar != "I" ? 10 : 8
            case "L":
                int += prevChar != "X" ? 50 : 30
            case "C":
                int += prevChar != "X" ? 100 : 80
            case "D":
                int += prevChar != "C" ? 500 : 300
            case "M":
                int += prevChar != "C" ? 1000 : 800
            default:
                break
            }
            
            
            prevChar = $0
        }
        return int
    }
    
}
