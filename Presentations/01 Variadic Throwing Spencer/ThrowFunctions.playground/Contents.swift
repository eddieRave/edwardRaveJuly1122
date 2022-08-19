import UIKit
import Foundation


/**
 ERRORS & THROWING FUNCTIONS
 
 Error handling is the process of responding to and recovering from error conditions in your program.

 Some operations aren’t guaranteed to always complete execution or produce a useful output. When an operation fails, it’s often useful to understand what caused the failure, so that your code can respond accordingly.

 As an example, consider the task of reading and processing data from a file on a disk.
 There are a number of ways this task can fail, including:
 - the file not existing at the specified path
 - the file not having read permissions
 - the file not being encoded in a compatible format
 Distinguishing among these different situations allows a program to resolve some errors and to communicate to the user any errors it can’t resolve.
 
 Functions usually fail because of bad information passed in their arguments or something failing within the function. This is where it can be helpful to "throw an error".
 
 What does it mean to "Throw an error"?
    - show a error if something goes wrong
 */



// We can throw errors from functions by marking them with the keyword "throws" after the parameter and before the return type.
func throwingFunction() throws -> Void {}



// We can create custom errors in Swift by creating an enum of the cases and then conforming it to "Error".
// We then check for errors and throw the case when the condition occurs.

// Example 1:
enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(moneyNeeded: Double)
    case outOfStock
}
var chocolateBar = ("chocolate bar", 0.75, 3)
func selectItem(selection: String, paid amount: Double) throws -> Bool {
    if selection != chocolateBar.0 {
        throw VendingMachineError.invalidSelection
    } else if amount < chocolateBar.1 {
        throw VendingMachineError.insufficientFunds(moneyNeeded: chocolateBar.1 - amount)
    } else if chocolateBar.2 == 0 {
        throw VendingMachineError.outOfStock
    }
    chocolateBar.2 -= 1
    return true
}
try selectItem(selection: "skittles", paid: 1.00)
//try selectItem(selection: "chocolate bar", paid: 0.50)
////try selectItem(selection: "chocolate bar", paid: 1.00)
////try selectItem(selection: "chocolate bar", paid: 1.00)
////try selectItem(selection: "chocolate bar", paid: 1.00)
////try selectItem(selection: "chocolate bar", paid: 1.00)

// Example 2:
enum PasswordError: Error {
    case obvious
    case invalidCharacter(character: String)
    case tooShort
}
func checkPassword(_ password: String) throws -> Bool {
    let forbiddenCharacters = "(){}[]|`¬¦! \"£$%^&*<>:;#~_-+=,@"
    if password == "password" {
        throw PasswordError.obvious
    } else if password.count < 6 {
        throw PasswordError.tooShort
    }
    for char in password {
        if forbiddenCharacters.contains(char) {
            throw PasswordError.invalidCharacter(character: String(char))
        }
    }
    return true
}



/* Handle the Errors You From Throws
    You won't be able to run a function that throws an error, so you will need to handle the error thrown with the keyword "try".
    We put the "try" expression inside of the "do" section of a "do catch" block. If an error is thrown, the "catch" section is triggered to more gracefully handle the error.
*/
do {
    try checkPassword("password")
    print("That password is good!") // This line isn't reached if an error is thrown
} catch {
    print("You can't use that password.")
}



/* Further reading:
    - https://www.hackingwithswift.com/sixty/5/8/writing-throwing-functions
    - https://www.hackingwithswift.com/sixty/5/9/running-throwing-functions
    - https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html
 */
