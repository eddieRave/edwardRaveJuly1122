//
//  Tester+Strings.swift
//  String
//
//  Created by Luat on 8/2/21.
//

//greeting[index]
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
            print(letter, terminator: "")
            print("\n")
            
        }
    }
    
    /// Using for-in-enumerated(), print letters at every even-index
    func printEvenIndexEnumerated(word: String) {
        for (index, letter) in word.enumerated() {
            if index % 2 == 0 {
                print(letter, terminator: "")
            }
        }
    }
    
    /// Using for-in-stride and string.index, print letters at every even-index
    func printEvenIndexStride(word: String) {
        for i in stride(from: 0, to: word.count - 1, by: 2) {
            print(word[word.index(word.startIndex, offsetBy: i)], terminator: "")
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
        var newWord = word
        switch word.first {
        case "a", "e", "i", "o", "u":
            newWord.append("yay")
        default:
           let addToEnd = newWord.removeFirst()
            newWord.append(String(addToEnd) + "ay")
        }
        print(newWord)
    }
    
    /// Using loop and string.index, returns true if input is a palindrome
    /// Do not use .reversed()
    func isPalindrome(word: String) -> Bool {
        var isEqual = true
        let L = word.count
        for (index, letter) in word.enumerated() {
            if letter != word[word.index(word.startIndex, offsetBy: L - index - 1)]{
                isEqual = false
            }
        }
        
        print(isEqual)
        return isEqual
    }
}

