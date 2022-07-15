import UIKit

enum Suit: Int, CaseIterable{
    case club,hearts, spade, diamonds
    func printDog(){
        print("dog")
    }
}

struct Card{
    let rank: Int
    let suit: Suit
}
Card(rank: 10, suit: .diamonds)


enum Direction: String{
    case north
    case south
    case east
    case west
}
let direction = Direction.north
let south = Direction.south.rawValue
let club = Suit.club.rawValue
print(club)

enum Color: String {
    case red = "0f0000"
    case black = "ffffff"
}

for suit in Suit.allCases{
    print(suit.rawValue)
}
switch direction {
case .south:
    print("south")
case .north:
    print("north")
case .east:
    print("east")
case .west:
    print("west")
}

enum ProductCode {
    case bar(Int)
    case QR(String)
    case image(UIImage)
}

let myCode = ProductCode.bar(0537439512397131)
let yourCode = ProductCode.QR("1hi21bw7syw8234")

switch myCode {
    
case .bar(let barCode):
    print(barCode)
case .QR(let QRCode):
    print(QRCode)
case .image(_):
    print("yes")
}
