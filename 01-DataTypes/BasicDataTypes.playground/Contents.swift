import Foundation

//let constant
let greeting =  "Hello"
// var mutable
var name = "tyler"

 print(greeting + name)

//String interpolation
 print("\(greeting) \(name)")
let num = 1
// can combine different data types
 print("\(name) \(num)")

let emoji = "🤣"
//type string index
let startIndex = name.startIndex
let lastIndex = name.endIndex
 print(startIndex)

let firstLetter = name[startIndex]

 print(firstLetter)

let secondIndex = name.index(after:startIndex)

let thirdIndex = name.index(startIndex , offsetBy: 2)

 print(name[thirdIndex])

// letter variable can be named anything
for letter in name{
      print(letter)
}

for i in 0..<5{
     print(i)
}

 for i in stride(from: 0, to: 10, by: 2){
     print(i)
}

let names = [ "mike", "tommy"]


var oneLine = ""
for (index, name) in names.enumerated() {
   print("\(index) : \(name)")
}

if names.contains("jerry"){
     print("found jerrry")
}
else{
     print("no jerry")
}

names.contains("jerry") ? print("found jerrry") :  print("no jerry")


print(name.contains("yle"))

greeting.sorted()


