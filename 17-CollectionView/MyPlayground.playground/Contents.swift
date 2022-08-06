import UIKit

var arrayOfInt: [Int] = [1,2,3,4]
var stringOfInt = ""
for num in arrayOfInt {
    stringOfInt.append(String(num) + ",")
}
if stringOfInt.last == "," {
    stringOfInt.removeLast()
}
print(stringOfInt)
let convertedArr = stringOfInt.components(separatedBy: ",")
print(convertedArr)
var originalArray = convertedArr.map { Int($0) ?? 0 }
print(originalArray)
