import UIKit
// require handmade initializars
// they can inherent
// have deinit function
// refence type ( hold the same place in memory when copied)

class Vehicle{
    init(numOfWheels: Int){
        self.numOfWheels = numOfWheels
    }
    let numOfWheels: Int
    func drive(){
        print("driving")
    }
}

let car = Vehicle(numOfWheels: 4)


car.numOfWheels
car.drive()

class Car: Vehicle{
    var numOfDoors: Int = 4
    
}

class BrokenCar: Car{
    override func drive(){
        print("i cant im broken")
    }
    
    deinit{
        print("no more car")
    }
}

let car2 = Car(numOfWheels: 4)

car2.numOfWheels
car2.drive()
car2.numOfWheels


let brokenCar = BrokenCar(numOfWheels: 3)

brokenCar.drive()

let brokenCar2 = brokenCar

brokenCar.numOfDoors = 2

// immutable
//value
// automatic initializers
// light weight
struct Dog{
    
    let numberOfLegs: Int
    var haslongHair: Bool = true
    
    mutating func getHairCut(){
        haslongHair = false
    }
}

var dog = Dog(numberOfLegs: 4)

dog.haslongHair = false
dog.getHairCut()


