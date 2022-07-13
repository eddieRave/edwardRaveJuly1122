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
        var arrayOfCopies: [Int] = []
        for num in firstNums {
            if secondNums.contains(num) {
                arrayOfCopies.append(num)
            }
        }
        return arrayOfCopies
    }
    
    /// first: "hello", second: "bye" -> ["e"]
    func findMatchingLetters(firstWord: String, secondWord: String) -> [Character] {
        var arrayOfMatches: [Character] = []
        for letter in firstWord {
            if secondWord.contains(letter) {
                arrayOfMatches.append(letter)
            }
        }
        return arrayOfMatches
    }
    
    /// Create a dictionary of the counts of the letters, ignoring spaces
    func createCounter(string: String) -> [Character: Int] {
        var dictOfLetterCounts: [Character : Int] = [:]
        let stringWithoutSpaces = string.filter {!$0.isWhitespace}
        for letter in stringWithoutSpaces {
            var occurrences = 0
            for char in string {
                if letter == char {
                    occurrences += 1
                }
                dictOfLetterCounts[letter] = occurrences
            }
        }
        return dictOfLetterCounts
    }
                                                                                 
    /// Find most frequent letter in string: "hello there" -> "e"
    func mostFrequentLetter(string: String) -> Character {
        let dictOfLetterCounts = createCounter(string: string)
        let maxValue = dictOfLetterCounts.values.max()
        var maxKey: Character?
        for (key, value) in dictOfLetterCounts {
            if value == maxValue {
                maxKey = key
            }
        }
        return maxKey ?? "."
    }

    /// Given a string of numbers: "121" and a sentence "fire water fire"
    /// Determine if the sequence can be translated to the sentence exactly, if each number represents only one word
    /// "121" and a sentence "fire water fire" (returns true)
    /// "1122" and a sentence "fire water fire water" (returns false)
    /// "11221" and a sentence "fire fire water water fire" (returns true)
    func translateNums(sequence: String, sentence: String) -> Bool {
        // create an empty dictionary
        var dictOfWords: [String : Int] = [:]
        // strip sentence of whitespace and add each item to array
        var arrayOfWords = sentence.components(separatedBy: " ")
        // transform sentence array into a Set to remove duplicates
        var setOfWords = Set(arrayOfWords)
        // loop through sentence set and add each word to the dictionary with a sequence number
        for (index, word) in setOfWords.enumerated() {
            dictOfWords[word] = index + 1
        }
        // loop through sentence array
        for (index, word) in arrayOfWords.enumerated() {
            // compare if each word sequence matches sequence number
            if word != dictOfWords[word] {
                return false
            }
        }
        return true
    }
    
    /// Find number of pairs that SUMS up to 0
    /// O(n) time: don't use nested for loops
    func findPairsOfOpposites(nums: [Int]) -> Int {
        
        return 0
    }
    
    /**
     Using Dictionary:
     Input: array of integers: [1, 4, 8, 1] with 1 having the highest priority.
     Output: reduce the distance bettwen priorities but keep the same priority ordering
     [1, 4, 8, 1] -> [1, 2, 3, 1]
     */
    func reduceDistanceKeepPriority(array: [Int]) -> [Int] {
        
        return []
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
        return 0
    }
    
}
