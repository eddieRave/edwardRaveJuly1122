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
        for letter in word {
            print(letter)
        }
    }
    
    /// Using for-in-enumerated(), print letters at every even-index
    func printEvenIndexEnumerated(word: String) {
        for (index, letter) in word.enumerated() {
            if index % 2 == 0 { print(letter)}
        }
    }
    
    /// Using for-in-stride and string.index, print letters at every even-index
    func printEvenIndexStride(word: String) {
        for index in stride(from: 0, to: word.count - 1, by: 2) {
            print(word[word.index(word.startIndex, offsetBy: index)])
        }
    }
    
    /**
     Pig Latin:
     1) Move the first letter to the end and add "ay"
     pig -> igpay
     latin -> atinlay
     2) IF word starts with a vowel, add "yay" to the word
     one -> oneyay
     */
    func printPigLatin(word: String) {
        var latin = word
        switch latin.first {
        case "a", "e", "i", "o", "u":
            latin += "yay"
        default:
            let first = latin.removeFirst()
            latin.append(first)
            latin += "ay"
        }
        print(latin)
    }
    
    /// Using loop and string.index, returns true if input is a palindrome
    /// Do not use .reversed()
    func isPalindrome(word: String) -> Bool {
        var isPalindrome = true
        
        for (index, letter) in word.enumerated() {
            if !(letter == word[word.index(word.startIndex, offsetBy: word.count - (index + 1))]) {
                isPalindrome = false
            }
        }
        return isPalindrome
    }
}
