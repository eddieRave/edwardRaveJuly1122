import UIKit

let array =
[1,2,2,2,2,6,7]

var firstEle = array.first

//1. optioning binding

//if let
if let firstNum = array.first{
    firstNum + 1
}


//guard let
func add(){
    guard let firstNum = array.first else
    {
        return
    }
    firstNum + 1
}

// nill coalence

(array.first ?? 0) + 1

// optional chaining
var optArray: [Int]? = nil
//cant set non optional values to nil
//let arr: [Int] = nil

optArray?.count

optArray = [1,2,3]

optArray?.count

var nestArray: [[Int]?]? = nil

nestArray?[0]?[0]

// force unwrapping
array.first! + 1

//implicit unwrapping

var num: Int!

num = array.first

num + 1

// switch never used but good to know
switch array.first{
case .none:
    print("no num")
case .some(let num):
    print(num)
}

//

let myDict: [String: ()->Void ]

var legitDict = [
    0: "the",
    1: "was",
    6: "was",
    2: "h",
    3: "red"
]

legitDict[0] = "then"
legitDict[4] = "forever"

let zero = 0

legitDict[zero] = "thent"

legitDict[0] ?? "then" + "was"

for key in legitDict.keys{
    legitDict[key]
}

for (key, value) in legitDict{
    print(key)
    print(value)
}
//array = [1,2,2,2,2,6,7]
let mySet = Set(array)

// maySet = [1,2,6,7]

