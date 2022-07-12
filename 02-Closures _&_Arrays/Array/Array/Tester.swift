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
        var new : [Int] = []
        for i in original {
            new.append(i * 2)
        }
        return new
    }
    // len/2 - 1 for even
    /// 2. Write a function to return the last half of the array, not including the median
    func lastHalf(array: [Int]) -> [Int] {

        var new : [Int] = []
        let arrLen = array.count
        
        if arrLen % 2 == 0{
            let dropNum = arrLen/2
            for i in dropNum ... (arrLen - 1){
                new.append(array[i])
                return new
            }
            
        }
            for i in (arrLen/2+1) ... (arrLen - 1){
                new.append(array[i])
            
            }
        return new
    }

    /// 3. Write a function that can creates an array populated with integers going from start (input) to end (input)
    func createArray(from start: Int, to end: Int) -> [Int] {
        var new : [Int] = []
        for i in start ... end{
            new.append(i)
        }
        return new
    }

    /**
        4. Using loops, create a square matrix (n x n) for any given n:
        Example: n = 3
        [[1,2,3],
        [4,5,6],
        [7,8,9]]
     */
    func create2DArray(n: Int) -> [[Int]] {
        var loc : Int = 0
        var arr = [[Int]]()
        for _ in 0  ... (n-1){
            var inner : [Int] = []
            for _ in 0 ... (n-1){
                loc += 1
                inner.append(loc)
            }
            arr.append(inner)
        }
        return arr
    }

    /// 5. Write a function that returns the number of pairs of elements that SUMS up to 0
    /// Input [1,2,3,-1,-2,-4] -> Output 2
    func findPairs(nums: [Int]) -> Int {
        var  newNums  : [Int] = nums
        var numPairs : Int = 0
        for n in newNums{
            for otherNum in newNums{
                if n + otherNum == 0 {
                    newNums = newNums.filter(){$0 == n}
                    numPairs += 1
                }
                    
            }
        }
                
        return numPairs
        
    }
    
    /// 6. Returns an array of indexes where the char occurs in input word
    func positionsOf(character: Character, in word: String) -> [Int] {
        var indexes : [Int] = []
        var index : Int  = 0
        for c in word{
            if c == character{
                indexes.append(index)
            }
            index += 1
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
        var currentNeeded : Int = 0
        var max : Int = 0
        
        for i in array{
            if i == "I"{
                currentNeeded += 1
                if currentNeeded > max{
                    max = currentNeeded
                }
            }
            else if i == "O"{
                currentNeeded -= 1
            }
        }
        return max
    }
    
    /// 8. Pig latin but with words separated by spaces
    func pigLatinSentence(sentence: String) -> String {
        var result : String = ""
        let components = sentence.components(separatedBy: " ")
        for w in components{
            result.append(returnPigLatin(word : w))
                
        }
        result.remove(at: result.index(before: result.endIndex))
        return result
    }
    
    func returnPigLatin(word: String) -> String {
        var newWord = word
        switch word.first {
        case "a", "e", "i", "o", "u":
            newWord.append("yay")
        default:
           let addToEnd = newWord.removeFirst()
            newWord.append(String(addToEnd) + "ay")
        }
        return newWord + " "
    
    
    }
    
    /**
        9. Find the best day to first BUY and then a day occuring after that day to SELL. Return the maximum profit (buy price - sell price)
        var prices = [7,1,5,3,6,4] -> returns 5  (buy at 1 and sell at 6)
     */
    func maxProfit(array: [Int]) -> Int {
        var maxDiff : Int  = 0
        for i in 0 ... array.count - 1{
            for j in i ... array.count - 1{
                let diff : Int = array[j] - array[i]
                if diff > maxDiff{
                    maxDiff = diff
                }
            }
        }
                
        return maxDiff
    }
    
    /**
        10. Input: array of integers: [1, 4, 8, 4] with 1 having the highest priority.
        Output: reduce the distance bettwen priorities but keep the same priority ordering
        [1, 4, 8, 4] -> [1, 2, 3, 2]
        [20, 15] -> [2, 1]
     */
    func reduceDistanceKeepPriority(array: [Int]) -> [Int] {
        var arrayCopy : [Int] = array
        let ranked = Array(Set(array)).sorted()
        for i in 0 ... ranked.count - 1{
            for j in 0 ... array.count - 1{
                if ranked[i] == array[j]{
                    arrayCopy[j] = i + 1
                }
            }
        }
        return arrayCopy
    }
}
