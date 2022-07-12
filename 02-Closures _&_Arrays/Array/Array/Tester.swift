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
        var newArray: [Int] = []
        for element in original {
            let newElement = element * 2
            newArray.append(newElement)
        }
        return newArray
    }

    /// 2. Write a function to return the last half of the array, not including the median
    func lastHalf(array: [Int]) -> [Int] {
        let slicedArray = array
        let midpoint = (array.count / 2) + 1
        return Array(slicedArray.suffix(from: midpoint))
    }

    /// 3. Write a function that can creates an array populated with integers going from start (input) to end (input)
    func createArray(from start: Int, to end: Int) -> [Int] {
        var slicedArray = [start]
        var counter = start
        while counter < end {
            slicedArray.append(counter + 1)
            counter += 1
        }
        return slicedArray
    }

    /**
        4. Using loops, create a square matrix (n x n) for any given n:
        Example: n = 3
        [[1,2,3],
        [4,5,6],
        [7,8,9]]
     */
    func create2DArray(n: Int) -> [[Int]] {
        var matrixArray: [[Int]] = []
        var counter = 0
        for row in 0..<n {
            var tempArray: [Int] = []
            for column in 0..<n {
                counter += 1
                tempArray.append(counter)
            }
            matrixArray.append(tempArray)
        }
        return matrixArray
    }

    /// 5. Write a function that returns the number of pairs of elements that SUMS up to 0
    /// Input [1,2,3,-1,-2,-4] -> Output 2
    func findPairs(nums: [Int]) -> Int {
        var pairs = 0
        for indexOfFirst in 0..<nums.count {
            for indexOfSecond in 0..<nums.count {
                if (nums[indexOfFirst] + nums[indexOfSecond] == 0) {
                    pairs += 1
                }
            }
        }
        // divide pair results in half since I didn't remove pairs when found
        pairs /= 2
        return pairs
    }
    
    /// 6. Returns an array of indexes where the char occurs in input word
    func positionsOf(character: Character, in word: String) -> [Int] {
        var arrayOfCharOccurences: [Int] = []
        for (index, letter) in word.enumerated() {
            if character == letter {
                arrayOfCharOccurences.append(index)
            }
        }
        return arrayOfCharOccurences
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
        var maxChairsNeeded = 0
        var collectionOfNeededChairs: [Int] = []
        for event in array {
            if event == "I" {
                maxChairsNeeded += 1
            } else {
                maxChairsNeeded -= 1
            }
            collectionOfNeededChairs.append(maxChairsNeeded)
        }
        return collectionOfNeededChairs.max()!
    }
    
    /// 8. Pig latin but with words separated by spaces
    func pigLatinSentence(sentence: String) -> String {
        let arrayOfPlainWords = sentence.split(separator: " ")
        var stringOfPigLatinWords = ""
        for word in arrayOfPlainWords {
            let pigLatinTranslation = returnPigLatin(word: String(word))
            if stringOfPigLatinWords == "" {
                stringOfPigLatinWords.append(pigLatinTranslation)
            } else {
                stringOfPigLatinWords.append(" ")
                stringOfPigLatinWords.append(pigLatinTranslation)
            }
        }
        return stringOfPigLatinWords
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
            let buyPrice = num
            let sellPrice = splitArray.max()
            let profit = sellPrice! - buyPrice
            if profit > maxProfit {
                maxProfit = profit
            }
        }
        return maxProfit
    }
    
    /**
        10. Input: array of integers: [1, 4, 8, 4] with 1 having the highest priority.
        Output: reduce the distance between priorities but keep the same priority ordering
        [1, 4, 8, 4] -> [1, 2, 3, 2]
        [20, 15] -> [2, 1]
     */
    func reduceDistanceKeepPriority(array: [Int]) -> [Int] {
        // sort the array and convert to a Set to remove duplicates
        let set = Set(array)
        let sortedSet = set.sorted()
        // create an empty array to return
        var placeValueArray: [Int] = []
        // loop through original array and assign each the index
        for num in array {
            placeValueArray.append(sortedSet.firstIndex(of: num)! + 1)
        }
        return placeValueArray
        
//        let set = Set(array)
//         let sortedSet = set.sorted()
//
//         let newArray = array.map{
//             sortedSet.firstIndex(of: $0)! + 1
//         }
//
//         return newArray
    }
}
