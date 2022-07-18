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
        for (index, char) in word.enumerated() {
            if index % 2 == 0 {
                print(char)
            }
        }
    }
    
    /// Using for-in-stride and string.index, print letters at every even-index
    func printEvenIndexStride(word: String) {
        for i in stride(from: 0, through: word.count - 1, by: 2) {
            print(word[word.index(word.startIndex, offsetBy: i)])
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
        var pigWord = word
        let vowels = "aeiou"
        if vowels.contains(word[word.startIndex]) {
            pigWord += "yay"
        } else {
            let firstChar = String(word[word.startIndex])
            pigWord.remove(at: word.startIndex)
            pigWord = pigWord + firstChar + "ay"
        }
        print(pigWord)
    }
    
    /// Using loop and string.index, returns true if input is a palindrome
    /// Do not use .reversed()
    func isPalindrome(word: String) -> Bool {
        var reversedWord = ""
        for i in stride(from: word.count - 1, through: 0, by: -1) {
            reversedWord.append(word[word.index(word.startIndex, offsetBy: i)])
        }
        if word == reversedWord {
            return true
        }
        return false
    }
}
