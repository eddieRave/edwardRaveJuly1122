//
//  Task.swift
//  ToDoApp
//
//  Created by Spencer Hurd on 7/20/22.
//

import Foundation

// MARK: Bored API
/**
 The boredapi.com server certificate is expired.
 To allow your app to trust it, do this:
     1) Info.plist: App Transport Security Settings -> Allow Arbitrary Load = YES
     2) Allow your URLSession to trust the server manually:
        https://developer.apple.com/documentation/foundation/url_loading_system/handling_an_authentication_challenge/performing_manual_server_trust_authentication
 */
struct Task: Codable {
    let activity: String?
}
/*
 MARK: url = https://www.boredapi.com/api/activity/
 {
   "activity": "Play a game of Monopoly",
   "type": "social",
   "participants": 4,
   "price": 0.2,
   "link": "",
   "key": "1408058",
   "accessibility": 0.3
 }
 */


/*
 MARK: url = https://api.chucknorris.io/jokes/random
 {
   "categories": [],
   "created_at": "2020-01-05 13:42:28.984661",
   "icon_url": "https://assets.chucknorris.host/img/avatar/chuck-norris.png",
   "id": "XLMSq5qlQnePgOBixRd2Tw",
   "updated_at": "2020-01-05 13:42:28.984661",
   "url": "https://api.chucknorris.io/jokes/XLMSq5qlQnePgOBixRd2Tw",
   "value": "A man once asked Chuck Norris, \"what happens when an unstoppable force meets and immovable object?\" Chuck Norris answered the question by punching himself in the face."
 }
 */
//struct Task: Decodable {
//    let value: String?
//}


// MARK: original
//struct Task {
//    let name: String?
//}
