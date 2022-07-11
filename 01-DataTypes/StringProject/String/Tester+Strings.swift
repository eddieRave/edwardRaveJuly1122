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
        for (index, letter) in word.enumerated() {
            if(index % 2 == 0) {
                print(letter)
            }
        }
    }
    
    /// Using for-in-stride and string.index, print letters at every even-index
    func printEvenIndexStride(word: String) {
        for index in stride(from: 0, through: word.count-1, by: 2) {
            print(word[word.index(word.startIndex, offsetBy: index)])
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
        var newString = word
        let vowels = "aeiou"
        
        if(vowels.contains(word[word.startIndex])) {
            newString.append("yay")
        } else {
            let firstLetter = newString.remove(at: newString.startIndex)
            newString.append("\(firstLetter)ay")
        }
        
        print(newString)
    }
    
    /// Using loop and string.index, returns true if input is a palindrome
    /// Do not use .reversed()
    func isPalindrome(word: String) -> Bool {
        var compareString = ""
        
        for letterIndex in stride(from: word.count-1, to: -1, by: -1) {
            compareString.append(word[word.index(word.startIndex, offsetBy: letterIndex)])
        }
        
        if(compareString != word) {
            return false
        }
        
        return true
    }
}
