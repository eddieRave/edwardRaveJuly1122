//
//  Tester.swift
//  Array
//
//  Created by Luat on 5/19/21.
//

import Foundation

class Tester {
    static let shared = Tester()
    
    /// 1. Write a function that takes an array of numbers and returns an array with each of the numbers multiplied by 2
    func multiplyByTwo(numbers original: [Int]) -> [Int]{
        return original.map{$0 * 2}
    }

    /// 2. Write a function to return the last half of the array, not including the median
    func lastHalf(array: [Int]) -> [Int] {
        return array.suffix(array.count / 2)
    }

    /// 3. Write a function that can creates an array populated with integers going from start (input) to end (input)
    func createArray(from start: Int, to end: Int) -> [Int] {
        // Make array of ints
        var arr = [Int]()
        
        for i in start...end {
            arr.append(i)
        }
        return arr
    }

    /**
        4. Using loops, create a square matrix (n x n) for any given n:
        Example: n = 3
        [[1,2,3],
        [4,5,6],
        [7,8,9]]
     */
    func create2DArray(n: Int) -> [[Int]] {
        // Create 2D Array
        var arr : [[Int]] = [[]]
        
        // loop through arr
        for row in 0..<n {
            for element in 0..<n {
                arr[row].append(row * n + element + 1)
            }
            arr.append([])
        }
        arr.removeLast()
        return arr
    }

    /// 5. Write a function that returns the number of pairs of elements that SUMS up to 0
    /// Input [1,2,3,-1,-2,-4] -> Output 2
    func findPairs(nums: [Int]) -> Int {
        var count = 0
        
        for i in nums {
            if nums.contains(where: {$0 + i == 0}) {
                count += 1
            }
        }
        return count/2
    }
    
    /// 6. Returns an array of indexes where the char occurs in input word
    func positionsOf(character: Character, in word: String) -> [Int] {
        // Make an array of ints
        var arr = [Int]()
        
        // Make character array from word
        //let characters = Array(word)
        
        // Loop through character array
        for(i, char) in word.enumerated() {
            if char == character {
                arr.append(i)
            }
        }
        
        return arr
    }
    
    /**
        7. Scenario: There is a conference room, and an array of `I`s and `O`s.
        `I` means a person enters the room and needs a chair.
        `O` means a person leaves the room and a chair opens up.
        Find the maximum number of chairs required to allow everyone (at any point) to have a seat
        Ex :
            [I, I, I ] = 3
            [ I, I, O, O] = 2
            [ I, I, O, I, I, O, O, O] = 3
     */
    func minimumChairs(array: [Character]) -> Int {
        var max = 0
        var current = 0
        
        for char in array {
            if char == "I" {
                current += 1
            } else {
                current -= 1
            }
            max = current > max ? current : max
        }
        return max
    }
    
    /// 8. Pig latin but with words separated by spaces
    func pigLatinSentence(sentence: String) -> String {
        // Create a variable to hold the Pig Latin sentence
        var plSentence = ""
        
        // Separate the words of our given sentence
        let words = sentence.split(separator: " ")
        var wordArray = [String]()
        
        for word in words {
            wordArray.append(returnPigLatin(word: String(word)))
        }
        plSentence = wordArray.joined(separator: " ")
        
        return plSentence
    
    }
    
    func returnPigLatin(word: String) -> String {
        var plWord = word
        
        // Get the first letter of the word
        let firstLetter = plWord.first!
        
        // Remove the first letter of new word
        plWord.removeFirst()
        
        // Make vowels
        let vowels = "aeiou"
        
        // Determine if the first letter is a vowel or not
        if vowels.contains(firstLetter) {
            plWord = (word + "yay")
        } else {
            plWord = (plWord + String(firstLetter) + "ay")
        }
        
        return plWord
    }
    
    /**
        9. Find the best day to first BUY and then a day occuring after that day to SELL. Return the maximum profit (buy price - sell price)
        var prices = [7,1,5,3,6,4] -> returns 5  (buy at 1 and sell at 6)
     */
    func maxProfit(array: [Int]) -> Int {
        var max = 0
        var splitArr = [Int]()
        
        // Loop through array
        for(i,num) in array.enumerated() {
            splitArr = Array(array.suffix(from: i))
            let buyPrice = num
            let sellPrice = splitArr.max()
            let profit = sellPrice! - buyPrice
            if profit > max {
                max = profit
            }
        }
        
        return max
    }
    
    /**
        10. Input: array of integers: [1, 4, 8, 4] with 1 having the highest priority.
        Output: reduce the distance bettwen priorities but keep the same priority ordering
        [1, 4, 8, 4] -> [1, 2, 3, 2]
        [20, 15] -> [2, 1]
     */
    func reduceDistanceKeepPriority(array: [Int]) -> [Int] {
        // Create a set and then sort that set
        let set = Set(array)
        let sortedSet = set.sorted()
        
        // Create an int array
        var arr = [Int]()
        
        // loop through our given array
        for i in array {
            arr.append(sortedSet.firstIndex(of: i)! + 1)
        }
        
        return arr
    }
}
