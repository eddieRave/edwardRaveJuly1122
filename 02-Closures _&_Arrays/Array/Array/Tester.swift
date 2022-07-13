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
        var multipledArray: [Int] = []
        for element in original {
            let multipledElement = element * 2
            multipledArray.append(multipledElement)
        }
        return multipledArray
    }

    /// 2. Write a function to return the last half of the array, not including the median
    func lastHalf(array: [Int]) -> [Int] {
        let midpoint = (array.count / 2) + 1
        //firstHalf doesn't get used here but is included to show it can be repurposed.
        let firstHalf = Array(array[..<midpoint])
        let secondHalf = Array(array[midpoint...])

        return secondHalf
    }

    /// 3. Write a function that can creates an array populated with integers going from start (input) to end (input)
    func createArray(from start: Int, to end: Int) -> [Int] {
        let arr = Array(start...end)
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
        var matrix: [[Int]] = [[]]
        
        for row in 0..<n {
            for element in 0..<n {
                matrix[row].append(row * n + element + 1)
            }
            matrix.append([])
       }
        //gets rid of final white space that was causing errors
        matrix.removeLast()
       return matrix
    }

    /// 5. Write a function that returns the number of pairs of elements that SUMS up to 0
    /// Input [1,2,3,-1,-2,-4] -> Output 2
    func findPairs(nums: [Int]) -> Int {
        let sortedArray = nums.sorted()
        var leftIndex = 0
        var rightIndex = sortedArray.count - 1
        var count = 0
            //slowly brings both pointers toward center
            while leftIndex < rightIndex {
                let leftElement = sortedArray[leftIndex]
                let rightElement = sortedArray[rightIndex]
                let currentSum = leftElement + rightElement
                let targetSum = 0
                
                if currentSum == targetSum {
                    count += 1
                    leftIndex += 1
                    rightIndex -= 1
                } else if currentSum < targetSum {
                    leftIndex += 1
                } else {
                    rightIndex -= 1
                }
            }
        return count
    }
    
    /// 6. Returns an array of indexes where the char occurs in input word
    func positionsOf(character: Character, in word: String) -> [Int] {
        let letters = Array(word)
        let wordLen = letters.count
        var counter = [Int]()
        var i = 0
        
        while i < wordLen {
            if letters[i] == character {
                counter.append(i)
                i += 1
            }else{
                i += 1
            }
        }
        return counter
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
        var chairs = 0
        var warmBodies = 0

        for person in array {
            if person == "I" && warmBodies >= chairs {
                chairs += 1
                warmBodies += 1
            }else if person == "I" {
                warmBodies += 1
            //someone leaving never affects chairs needed
            }else if person == "O" && warmBodies >= 1 {
                warmBodies -= 1
            }
        }
        return chairs
    }
    
    /// 8. Pig latin but with words separated by spaces
    func pigLatinSentence(sentence: String) -> String {
        let inputWords = sentence.split(separator: " ")
        var translatedWords = ""
        for word in inputWords {
            let translate = returnPigLatin(word: String(word))
            if translatedWords == "" {
                translatedWords.append(translate)
            } else {
                translatedWords.append(" ")
                translatedWords.append(translate)
            }
        }
        return translatedWords
    }
    
    func returnPigLatin(word: String) -> String {
        var copyOfWord = word
                 let vowels = "aeiou"
                 if (vowels.contains(copyOfWord[copyOfWord.startIndex])) {
                     copyOfWord.append("yay")
                 } else {
                     let firstLetter = copyOfWord.remove(at: copyOfWord.startIndex)
                     copyOfWord.append(String(firstLetter) + "ay")
                 }
                 return copyOfWord
    }
    
    /**
        9. Find the best day to first BUY and then a day occuring after that day to SELL. Return the maximum profit (buy price - sell price)
        var prices = [7,1,5,3,6,4] -> returns 5  (buy at 1 and sell at 6)
     */
    func maxProfit(array: [Int]) -> Int {
        var maxProfit = 0
        var splitArray: [Int] = []
        for (index, num) in array.enumerated() {
            splitArray = Array(array.suffix(from: index))
            let cost = num
            let sellPrice = splitArray.max()
            let profit = sellPrice! - cost
            if profit > maxProfit {
                maxProfit = profit
            }
        }
        return maxProfit
    }
    
    /**
        10. Input: array of integers: [1, 4, 8, 4] with 1 having the highest priority.
        Output: reduce the distance bettwen priorities but keep the same priority ordering
        [1, 4, 8, 4] -> [1, 2, 3, 2]
        [20, 15] -> [2, 1]
     */
    func reduceDistanceKeepPriority(array: [Int]) -> [Int] {
        return array.map({
            number in
            Set(array).sorted().firstIndex(of: number)! + 1 })
    }
}
