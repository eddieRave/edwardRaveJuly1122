import UIKit

var greeting = "Hello, playground"




//let char = dog()
//let charles = char
//char.name = "char"
//char.name
//charles.name
//charles.name = "charles"
//charles.name
//char.name








































func printName(){
    let max = Dog()
    print(max)
}
class Dog {
    var name: String?
    func bark(){
        print("dog noises")
    }
    var weight: Int?
    var amountOfLove: Int?
    var breed: String?
    var color: UIColor?
    unowned var dogwalker: DogWalker?
    deinit{
        print("dog deinit")
    }
}

class DogWalker{
    let dog: Dog
    func walkDog(){
        print("walking the dog")
    }
    init(dog: Dog){
        self.dog = dog
    }
    deinit{
        print("dog walker deinit")
    }
}
func dogBarking(){
    let max = Dog()
    let catherine = DogWalker(dog: max)
    max.dogwalker = catherine
    catherine.walkDog()
        max.bark()
}

var yesSting: Int = 8
//dogBarking(type: yesSting)
var array = [1,2,3,45,5]
array.sort()
//cf.getR



extension Dog{
    func wagTail(){
        
    }
}



print(7.52.makePrice())

