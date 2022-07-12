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
    /// DONE
    func multiplyByTwo(numbers original: [Int]) -> [Int]{
        return original.map { $0 * 2}
    }

    /// 2. Write a function to return the last half of the array, not including the median
    func lastHalf(array: [Int]) -> [Int] {
        // Step 1: Get the length of the array / 2
        var arr: [Int] = []
        
        for i in stride(from: array.count/2+1, to: array.count, by: 1) {
            arr.append(array[i])
        }
        
        return arr
    }

    /// 3. Write a function that can creates an array populated with integers going from start (input) to end (input)
    ///  DONE
    func createArray(from start: Int, to end: Int) -> [Int] {
        // Create empty array named arr
        var arr = [Int]()
        
        // Fill in arr
        for i in stride(from: start, through: end, by: 1) {
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
        var result: [Int] = []
        var container: [[Int]] = []
        
        for num in 1...n * n {
            if num % n == 0 {
                result.append(num)
                container.append(result)
                result = []
                continue
            }
            result.append(num)
        }
        return container
    }

    /// 5. Write a function that returns the number of pairs of elements that SUMS up to 0
    /// Input [1,2,3,-1,-2,-4] -> Output 2
    /// DONE
    func findPairs(nums: [Int]) -> Int {
        var count = 0
        
        // Loop through array
        for(i,ele) in nums.enumerated() {
            let remainingEle = nums[i+1..<nums.count]
            for otherEle in remainingEle {
                if ele + otherEle == 0 {
                    count += 1
                }
            }
        }
        return count
    }
    
    /// 6. Returns an array of indexes where the char occurs in input word
    ///  DONE
    func positionsOf(character: Character, in word: String) -> [Int] {
        // Create empty array
        var arr = [Int]()
        
        // Now loop through word
        for (index, char) in word.enumerated() {
            if(char == character) {
                arr.append(index)
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
        var peopleIn = 0
        
        for person in array {
            if person == "I" && peopleIn >= max {
                max += 1
                peopleIn += 1
            } else if person == "I" {
                peopleIn += 1
            } else if person == "O"  && peopleIn >= 1 {
                peopleIn -= 1
            }
        }
        return max
    }
    
    /// 8. Pig latin but with words separated by spaces
    ///  DONE
    func pigLatinSentence(sentence: String) -> String {
        // Define a String variable containing the pig latin sentence
        var plSentence = ""
        
        // Separate the sentence into separate words
        let sentenceArr = sentence.components(separatedBy: " ")
        
        // Loop through our given sentence
        for word in sentenceArr {
            var newWord = word.lowercased()
            
            // Get first letter of the word
            let firstLetter = newWord.first!
            
            // Remove the first letter of new word
            newWord.removeFirst()
            
            // Make an array of vowels
            let vowels = "aeiou"
            
            // Determine if the first letter if a vowel or not
            if vowels.contains(firstLetter) {
                plSentence.append(word + "yay")
            } else {
                plSentence.append(newWord + String(firstLetter) + "ay" + " ")
            }
        }
        return plSentence
    }
    
    func returnPigLatin(word: String) -> String {
        return ""
    }
    
    /**
        9. Find the best day to first BUY and then a day occuring after that day to SELL. Return the maximum profit (buy price - sell price)
        var prices = [7,1,5,3,6,4] -> returns 5  (buy at 1 and sell at 6)
     */
    func maxProfit(array: [Int]) -> Int {
        var best = 0
        
        for(index, num) in array.enumerated() {
            for(index2, num2) in array.enumerated() {
                if index2 <= index {
                    continue
                } else if num2 - num > best {
                    best = num2 - num
                }
            }
        }
        return best
    }
    
    /**
        10. Input: array of integers: [1, 4, 8, 4] with 1 having the highest priority.
        Output: reduce the distance bettwen priorities but keep the same priority ordering
        [1, 4, 8, 4] -> [1, 2, 3, 2]
        [20, 15] -> [2, 1]
     */
    func reduceDistanceKeepPriority(array: [Int]) -> [Int] {
      
        /*
        // Create a set
        var set = Set<Int>()
        
        // Insert elements into set
        for i in array {
            set.insert(array[i])
        }
        set.sorted()
        
        // Make dictionary
        var myDictionary = [Int:Int]()
        
        // loop through set
        var num = 1
        for(num, ele) in set.enumerated() {
            myDictionary[num] = ele
        }
        
        // Create a new array
        var arr = [Int]()
        
        // loop through array*/
        var result: [Int] = []
        
        let single = Set(array)
        let sorted = single.sorted()
        
        for num in array {
            result.append(sorted.firstIndex(of: num)! + 1)
        }
        
        
        return result
    }
}
