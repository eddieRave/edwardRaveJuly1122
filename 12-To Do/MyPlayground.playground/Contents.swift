import UIKit

class Person {
    //1:
    /*weak*/ var friend: Person?
    
    deinit {
        print("person deleted")
    }
}



func test() {
    let jake = Person()
    let steve = Person()
    
    jake.friend = steve
    
    //2:
    /*steve.friend = jake*/
}

/*If comment 2 is allowed to run there is a circular
 reference and neither variable is deinitialized,
 if comment 1 is also allowed to run the weak references do
 not form a circle and deinitialization occurs.*/

test()
