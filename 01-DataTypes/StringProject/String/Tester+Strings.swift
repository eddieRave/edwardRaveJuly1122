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
    ///
    /// DONE
    /// Using print command
    func printWord(word: String) {
        print(word)
    }
    
    // DONE
    /// input "hello" should print "HELLO"
    func printUpperCase(word: String) {
        print(word.uppercased())
    }
    
    // DONE
    /// Using for loop, print each char in word
    func printLetters(word: String) {
        for letter in word {
            print(letter)
        }
    }
    
    // DONE
    /// Using for-in-enumerated(), print letters at every even-index
    func printEvenIndexEnumerated(word: String) {
        for(n,c) in word.enumerated() {
            if (n % 2 == 0) {
                print("\(c)")
            }
        }
    }
    
    /// Using for-in-stride and string.index, print letters at every even-index
    func printEvenIndexStride(word: String) {
        for i in stride(from: 0, through: word.count - 1, by: 2) {
            print(word[word.index(word.startIndex,offsetBy: i)])
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
    // DONE
    func printPigLatin(word: String) {
        // make all letters of word lowercased
        var newWord = word.lowercased()
        
        // get the first letter of the word
        let firstLetter = newWord.first!
        
        // Remove the first letter of new word for use if first letter was not a vowel
        newWord.removeFirst()

        // Make a character array
        let vowels = "aeiou"
        
        // Determine if the first letter is a vowel or not
        if vowels.contains(firstLetter) {
                print(word + "yay")
        } else {
            print(newWord + String(firstLetter) + "ay")
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
