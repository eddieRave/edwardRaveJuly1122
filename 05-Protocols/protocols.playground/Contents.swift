import UIKit


protocol Sendable{
    var text: String {get set}
    var date: Date {get}
    var sendText: ()->Void {get}
    func sendMessage()
}


struct TextMessage: Sendable, CustomStringConvertible, Equatable{
    var description: String = "a Text message object"
    
    func sendMessage() {
        print("yes")
    }
    
    static func == (lhs: TextMessage, rhs: TextMessage) -> Bool {
        lhs.date == rhs.date
    }
    
    var text: String = "whats sup"
    
    var date: Date = Date.now
    
    var sendText: () -> Void = {
        print("message sent")
    }
}

struct Email: Sendable{
    func sendMessage() {
        print("print \(text)")
    }
    
    static func == (lhs: Email, rhs: Email) -> Bool {
        lhs.date == rhs.date
    }
    
    var text: String = "hello"
    
    var date: Date = Date.now
    
    var sendText: () -> Void = {
        print("email sent")
    }
}


func recieveMessgae(message: Sendable){

}

