//
//  Task.swift
//  ToDoApp
//
//  Created by Spencer Hurd on 7/20/22.
//

import Foundation

struct Task: Decodable {
    let value: String?
}

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


// MARK: Bored API
// MARK: unable to use because it in not secure (bad certificate)
/*
 NSURLErrorFailingURLPeerTrustErrorKey=<SecTrustRef: 0x600002624140>, NSLocalizedDescription=An SSL error has occurred and a secure connection to the server cannot be made.})"
 */
//struct Task: Decodable {
//    let activity: String?
//}
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


// MARK: original
//struct Task {
//    let name: String?
//}
