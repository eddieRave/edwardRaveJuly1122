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
        var resultArr : [Int] = []
        for i in firstNums{
            if secondNums.contains(i){
                resultArr.append(i)
            }
                
        }
        return resultArr
    }
    
    /// first: "hello", second: "bye" -> ["e"]
    func findMatchingLetters(firstWord: String, secondWord: String) -> [Character] {
        var resultArr : [Character] = []
        for i in firstWord{
            if secondWord.contains(i){
                resultArr.append(i)
            }
        }
        return resultArr
    
    }
    
    
    /// Create a dictionary of the counts of the letters, ignoring spaces
    func createCounter(string: String) -> [Character: Int] {
        var resultDict = Dictionary<Character, Int>()
        for i in string{
            if i != " " {
                resultDict[i] = (resultDict[i] ?? 0) + 1 
            }
        }
        return resultDict
    }
    
    /// Find most frequent letter in string: "hello there" -> "e"
    func mostFrequentLetter(string: String) -> Character {
        var resultDict = Dictionary<Character, Int>()
        
        for i in string{
            if i != " " {
                resultDict[i] = (resultDict[i] ?? 0) + 1
            }
        }
        
        var mostFreqCharSoFar : Character = " "
        var maxNum : Int = 0
        for ( char , num ) in resultDict{
            if num > maxNum{
                maxNum = num
                mostFreqCharSoFar = char
            }
            
        }
        return mostFreqCharSoFar
    }
    
    /// Given a string of numbers: "121" and a sentence "fire water fire"
    /// Determine if the sequence can be translated to the sentence exactly, if each number represents only one word
    /// "121" and a sentence "fire water fire" (returns true)
    /// "1122" and a sentence "fire water fire water" (returns false)
    /// "11221" and a sentence "fire fire water water fire" (returns true)
    func translateNums(sequence: String, sentence: String) -> Bool {
        
        var resultDict = Dictionary<Character, String>()
        let words = sentence.components(separatedBy: " ")
        let chars = Array(sequence)

        for i in 0 ..< chars.count {
            if resultDict[chars[i]] == nil{
                resultDict[ chars[i] ] = words[i]
            }
            else{
                if resultDict[ chars[i] ] != words[i]{
                    return false
                }
            }
        }
 
        return true
    }
    
    /// Find number of pairs that SUMS up to 0
    /// O(n) time: don't use nested for loops
    func findPairsOfOpposites(nums: [Int]) -> Int {
        var count : Int = 0
        for i in 0 ..< nums.count {
            let subArray = nums[i...nums.count-1]
            if subArray.contains( -1 * nums[i] ){
                count += 1
            }
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
        var resultDict = Dictionary<Int, Int>()
        var resultArray : [Int] = []
        let sortedArray = (Set(array)).sorted()
        
        for i in sortedArray.indices {
            resultDict[sortedArray[i]] = i + 1
        }
        for i in array{
            resultArray.append(resultDict[i]!)
        }
        return resultArray
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
 
        var total : Int = 0
        for char in roman {
            var lastNumeral: Character
            for numeral in roman{
                var absVal : Int  = 0
                switch numeral{
                    case "I":
                        absVal = 1
                    case "V":
                        absVal = 5
                    case "X":
                        absVal = 10
                    case "L":
                        absVal = 50
                    case "C":
                        absVal = 100
                    case "D":
                       absVal = 500
                    case "M":
                        absVal = 1000
                    default:
                    print("Not a roman numeral")
                }
                

            }
                    
        }

        return total
    }
    
}
