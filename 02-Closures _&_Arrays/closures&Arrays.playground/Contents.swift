import UIKit


// paramaters
func add(num1: Int, num2: Int){
    print("\(num1 + num2)")
}
add(num1: 1, num2: 1)
//double parameters
func substract(_ num1: Int, _ num2: Int){
    print("\(num1 - num2)")
}

substract(1, 1)

let names = ["dave", "char", "mart"]
// first paramater name is for external use when calling the function
//second paramater name is internal and only used inside function scope

func getNames(for names: [String], at index: Int){
// cant mutate paramaters
//    index += 1
    print(names[index])
   
}

getNames(for: names, at: 1)

//return values
func isCharHere() -> Bool{
    if names.contains("char"){
        return true
    }
    return false
}
// if the function is a single line  you can
func isDaveHere() -> Bool{
    names.contains("dave")
}

//inout
func square(number: inout Int){
    number *= number
}
var myNumber = 2

square(number: &myNumber)
//varied amount of parameters
func addNumbers(nums: Int...) -> Int{
    var sum = 0
    nums[0]
    for num in nums{
        sum += num
    }
    return sum
}
addNumbers(nums: 1, 2, 3, 4, 6, 5)

//returning multiple values

func getMinMax(nums: [Int]) -> (min: Int, max: Int){
    nums.sorted()
    
    return (min: nums.startIndex, max: nums.endIndex)
}

let minMax = getMinMax(nums: [1, 2, 3, 4, 6, 5])

print(minMax.min)
print(minMax.max)
//closures as values
var myClosure: (Int, String) -> Int

myClosure = {
    num, name in
    
     num
}
myClosure = {
    num, name in
    
    return num * 2
}
myClosure(3,"heelo")
//closures as parameters
func prepareNumber(num: Int, doubleNum: (Int, String) -> Int) -> Int {
   return doubleNum(num*2, "hello")
}
prepareNumber(num: 9, doubleNum: myClosure)



prepareNumber(num: 8, doubleNum: {
    num, name in
    
    return num*2
})

prepareNumber(num: 9){
    num, name in
    
    return num*2
}

// array repeating
var arrayD = Array(repeating: "d", count: 5)

let array: [Bool] = []


//remove at
arrayD.remove(at: 2)
//insert at
arrayD.insert("c", at: 2)
//append
arrayD.append("a")

arrayD.append(contentsOf: ["a", "c"])

//map"
var newArrayD = arrayD.map({
    $0 + "d"
})

arrayD.map({
    element in
    element + "d"
    
})
arrayD.map{
    $0 + "d"
}
arrayD.sorted(by: {
    ele0, ele1 in
    return ele0 > ele1
})
//
let sorted = arrayD.sorted(by: {
    $0 > $1
})
// filter

arrayD.filter{
    $0 == "d"
}

arrayD.filter{
    ele  in
    ele == "d"
}

arrayD.filter({
    ele  in
    ele == "d"
})
