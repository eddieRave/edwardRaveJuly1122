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
        
        let newArr = original.map{
            $0 * 2
        }
        
        return newArr
    }

    /// 2. Write a function to return the last half of the array, not including the median
    func lastHalf(array: [Int]) -> [Int] {
        var from = array.count/2
        var returnArr: [Int] = []
        
        if(array.count % 2 != 0) {
            from += 1
        }
        
        for i in stride(from: from, to: array.count, by: 1) {
            returnArr.append(array[i])
        }
        
        return returnArr
    }

    /// 3. Write a function that can creates an array populated with integers going from start (input) to end (input)
    func createArray(from start: Int, to end: Int) -> [Int] {
        var returnArr: [Int] = []
        
        for i in stride(from: start, through: end, by: 1) {
            returnArr.append(i)
        }
        
        return returnArr
    }

    /**
        4. Using loops, create a square matrix (n x n) for any given n:
        Example: n = 3
        [[1,2,3],
        [4,5,6],
        [7,8,9]]
     */
    func create2DArray(n: Int) -> [[Int]] {
        var returnArr: [[Int]] = []
        
        for y in stride(from: 0, to: n, by: 1) {
            var tempArr: [Int] = []
            for x in stride(from: 0, to: n, by: 1) {
                tempArr.append(y * n + (x+1))
            }
            
            returnArr.append(tempArr)
        }
        
        return returnArr
    }

    /// 5. Write a function that returns the number of pairs of elements that SUMS up to 0
    /// Input [1,2,3,-1,-2,-4] -> Output 2
    func findPairs(nums: [Int]) -> Int {
        var count = 0
        
        for currIndex in stride(from: 0, to: nums.count - 1, by: 1) {
            let currNum = nums[currIndex]
            for compIndex in stride(from: currIndex + 1, to: nums.count, by: 1) {
                let compNum = nums[compIndex]
                if currNum + compNum == 0 {
                    count += 1
                }
            }
        }
        
        return count
    }
    
    /// 6. Returns an array of indexes where the char occurs in input word
    func positionsOf(character: Character, in word: String) -> [Int] {
        var indexes: [Int] = []
        
        for i in stride(from: 0, to: word.count, by: 1) {
            let wordIndex = word.index(word.startIndex, offsetBy: i)
            let atIndex = word[wordIndex]
            
            if(atIndex == character) {
                indexes.append(i)
            }
        }
        
        return indexes
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
        
        for i in stride(from: 0, to: array.count, by: 1) {
            if array[i] == "I" {
                current += 1
            } else {
                if(current > max) {
                    max = current
                }
                
                current -= 1
            }
        }

        if current > max {
            max = current
        }
        
        return max
    }
    
    /// 8. Pig latin but with words separated by spaces
    func pigLatinSentence(sentence: String) -> String {
        let words = sentence.split(separator: " ")
        var pigWords: [String] = []
        
        for word in words {
            let pigWord = returnPigLatin(word: String(word))
            pigWords.append(pigWord)
        }
        
        let pigSentence = pigWords.joined(separator: " ")
        
        return pigSentence
    }
    
    func returnPigLatin(word: String) -> String {
        var newString = word
        let vowels = "aeiou"
        
        if(vowels.contains(word[word.startIndex])) {
            newString.append("yay")
        } else {
            let firstLetter = newString.remove(at: newString.startIndex)
            newString.append("\(firstLetter)ay")
        }
        
        return newString
    }
    
    /**
        9. Find the best day to first BUY and then a day occuring after that day to SELL. Return the maximum profit (buy price - sell price)
        var prices = [7,1,5,3,6,4] -> returns 5  (buy at 1 and sell at 6)
     */
    func maxProfit(array: [Int]) -> Int {
//        func returnMinIndex(_ arr: [Int]) -> Int {
//            var min = arr[0]
//            var minIndex = 0
//            for i in stride(from: 0, to: arr.count, by: 1) {
//                if(arr[i] < min) {
//                    min = arr[i]
//                    minIndex = i
//                }
//            }
//
//            return minIndex
//        }
//
//        func returnSellDay(_ arr: [Int], lowDay: Int) -> Int {
//            var max = arr[lowDay]
//            var maxIndex =  lowDay
//
//            for i in stride(from: lowDay, to: arr.count, by: 1) {
//                if(arr[i] > max) {
//                    max = arr[i]
//                    maxIndex = i
//                }
//            }
//
//            return maxIndex
//        }
//
//        let lowDay = returnMinIndex(array)
//        let sellDay = returnSellDay(array, lowDay: lowDay)
//        let maxProfit = array[sellDay] - array[lowDay]
        
        var maxProfit = array[1] - array[0]
        
        for i in stride(from: 0, to: array.count - 1, by: 1) {
            for j in stride(from: i + 1, to: array.count, by: 1) {
                let currentProfit = array[j] - array[i]
                if(currentProfit > maxProfit) {
                    maxProfit = currentProfit
                }
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
        let set = Set(array)
        let sortedSet = set.sorted()
        
        let newArray = array.map{
            sortedSet.firstIndex(of: $0)! + 1
        }
        
        return newArray
    }
}
