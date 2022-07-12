//
//  Tester+Strings.swift
//  String
//
//  Created by Luat on 8/2/21.
//

import Foundation

extension Tester {
    /// Creating a git conflict
    /// Adding comment
    ///
    /// Using print command
    func printWord(word: String) {
        print(word)
    }
    
    /// input "hello" should print "HELLO"
    func printUpperCase(word: String) {
        print(word.uppercased())
    }
    
    /// Using for loop, print each char in word
    func printLetters(word: String) {
        for char in word {
            print(char)
        }
    }
    
    /// Using for-in-enumerated(), print letters at every even-index
    func printEvenIndexEnumerated(word: String) {
        for (ind, char) in word.enumerated() {
            if ind % 2 == 0 {
                print(char)
            }
        }
    }
    
    /// Using for-in-stride and string.index, print letters at every even-index
    func printEvenIndexStride(word: String) {
        let startIndex = word.startIndex
        
        for i in stride(from: 0, through: word.count - 1, by: 1) {
            if i % 2 == 0 {
            let currentIndex = word.index(startIndex, offsetBy: i)
            print(word[currentIndex])
            }
        }
    }
    
    /**
     Pig Latin:
     1) Move the first letter to the end and add "ay"
     pig -> igpay
     latin -> atinay
     2) IF word starts with a vowel, add "yay" to the word
     one -> oneyay
     */
    func printPigLatin(word: String) {
        let vowels = "aeiou"
        
        if vowels.contains(word[word.startIndex]) {
            print("\(word)yay")
        }else{
            var newWord = word
            newWord.removeFirst(1)
            print("\(newWord)\(word[word.startIndex])ay")
        }
    }
    
    /// Using loop and string.index, returns true if input is a palindrome
    /// Do not use .reversed()
    func isPalindrome(word: String) -> Bool {
        let characters = Array(word)
        var currentIndex = 0
        
        while currentIndex < characters.count / 2 {
            if characters[currentIndex] != characters[characters.count - currentIndex - 1] {
                return false
            }
            currentIndex += 1
        }
        return true
    }
}
