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
        var dictOfWords: [String : Int] = [:]
        let arrayOfWords = sentence.components(separatedBy: " ")
        let setOfWords = Set(arrayOfWords)
        for (index, word) in setOfWords.enumerated() {
            dictOfWords[word] = index + 1
        }
        let arrayOfSequence: [Character] = Array(sequence)
        var arrayOfNumberSequence: [Int] = []
        for char in arrayOfSequence {
            guard let num = char.wholeNumberValue else {
                return false
            }
            arrayOfNumberSequence.append(num)
        }
        for (index, word) in arrayOfWords.enumerated() {
            // compare number in sequence to value at word in dictionary
            switch word {
            case "fire":
                if arrayOfNumberSequence[index] != dictOfWords[word] {
                    return false
                }
            case "water":
                if arrayOfNumberSequence[index] != dictOfWords[word] {
                    return false
                }
            default:
                print("Error, word not found.")
            }
        }
        return true
    }
    
    /// Find number of pairs that SUMS up to 0
    /// O(n) time: don't use nested for loops
    func findPairsOfOpposites(nums: [Int]) -> Int {
        var pairs = 0
        for num in nums {
            if nums.contains(-num) {
                pairs += 1
            }
        }
        if pairs > 0 {
            pairs /= 2
        }
        return pairs
    }
    
    /**
     Using Dictionary:
     Input: array of integers: [1, 4, 8, 1] with 1 having the highest priority.
     Output: reduce the distance bettwen priorities but keep the same priority ordering
     [1, 4, 8, 1] -> [1, 2, 3, 1]
     */
    func reduceDistanceKeepPriority(array: [Int]) -> [Int] {
        let set = Set(array)
        let sortedSet = set.sorted()
        var placeValueArray: [Int] = []
        for num in array {
            placeValueArray.append(sortedSet.firstIndex(of: num)! + 1)
        }
        return placeValueArray
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
        var dictionaryOfNumerals: [Character:Int] = [:]
        for char in roman {
            var value = 0
            switch char {
            case "I":
                value = 1
            case "V":
                value = 5
            case "X":
                value = 10
            case "L":
                value = 50
            case "C":
                value = 100
            case "D":
                value = 500
            case "M":
                value = 1000
            default:
                print("Letter \(char) was not found. ")
            }
            dictionaryOfNumerals[char] = value
        }
        var total = 0
        var previous: Character = roman.first ?? "I"
        let reversedString = roman.reversed()
        for (i, char) in reversedString.enumerated() {
            guard let previousValueInDictionary = dictionaryOfNumerals[previous] else {
                return 0
            }
            guard let charValueInDictionary = dictionaryOfNumerals[char] else {
                return 0
            }
            if i == 0 {
                total += charValueInDictionary
                previous = char
            } else if (charValueInDictionary >= previousValueInDictionary) {
                total += charValueInDictionary
                previous = char
            } else if (charValueInDictionary < previousValueInDictionary) {
                total -= charValueInDictionary
                previous = char
            } else {
                print("5th condition: total = \(total)")
            }
        }
        return total
    }
    
}
