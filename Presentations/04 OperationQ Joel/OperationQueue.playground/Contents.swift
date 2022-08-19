import UIKit

//Creating an Operation Queue
let queue = OperationQueue()

//QOS Testing
//queue.qualityOfService = .userInteractive
//print("START THREAD QOS: ", Thread.current.qualityOfService.rawValue)
//print("QUEUE QOS: ", queue.qualityOfService.rawValue)

//BlockOperations
let dog = BlockOperation {
//    sleep(2)
    print("1: 🐕")
}

let cat = BlockOperation {
//    sleep(2)
    print("2: 🐈")
}

let cow = BlockOperation {
//    sleep(2)
    print("3: 🐄")
    
    //QOS Testing
//    print("COW QOS: ", cow.qualityOfService.rawValue)
//    print("THREAD QOS: ", Thread.current.qualityOfService.rawValue)
}

let pig = BlockOperation {
//    sleep(2)
    print("4: 🐖")
//    print("THREAD QOS: ", Thread.current.qualityOfService.rawValue)
}

let goat = BlockOperation {
//    sleep(2)
    print("5: 🐐")
}

let raccoon = BlockOperation {
//    sleep(2)
    print("6: 🦝")
}

// MARK: maxConcurrentOperationCount
//queue.maxConcurrentOperationCount = 2

// MARK: queuePriority
//dog.queuePriority = .veryHigh
//cat.queuePriority = .veryLow
//cow.queuePriority = .veryLow
//pig.queuePriority = .veryLow
//goat.queuePriority = .veryLow
//raccoon.queuePriority = .normal

// MARK: QOS
//cow.qualityOfService = .background

// MARK: addDependency
dog.addDependency(raccoon)

// MARK: completion blocks
pig.completionBlock = {
    if(!pig.isCancelled) {
        print("Pig completed")
    }
}

//let fish = Operation()

// MARK: addOperation
//// Operations are executed in the order they are added to the queue
//queue.addOperation(dog)
//queue.addOperation(cat)
//queue.addOperation(cow)
//queue.addOperation(pig)
//queue.addOperation(goat)
//queue.addOperation(raccoon)

// MARK: Waiting for operations
//queue.waitUntilAllOperationsAreFinished()

// MARK: addOperations
queue.addOperations([dog, cat, cow, pig, goat, raccoon], waitUntilFinished: false)

//print("Hello")

// isReady testing
print()
print("isReady")
print("Dog: ", dog.isReady)
print("Cat: ", cat.isReady)
print("Cow: ", cow.isReady)
print("Pig: ", pig.isReady)
print("Goat: ", goat.isReady)
print("Raccoon: ", raccoon.isReady)
print()

// MARK: cancel
pig.cancel()

//operation attributes
dog.isFinished
dog.isAsynchronous
dog.isExecuting
 
