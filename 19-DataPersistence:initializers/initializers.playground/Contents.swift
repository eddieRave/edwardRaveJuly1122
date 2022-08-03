import UIKit

class Animal{
    var name: String
    init(name: String ){
        self.name = name
        print("noise")
    }
    init(num: Int){
        self.name  = "Cat\(num)"
    }
    init(){
        self.name = "zebra"
    }
}

class Cat: Animal{
    
}



struct Model: Decodable{
    let name: String
    let age: Int
    
    enum CodingKeys: String, CodingKey{
        
        case name: "name"
        case age: "age_of_Person"
    }
}
