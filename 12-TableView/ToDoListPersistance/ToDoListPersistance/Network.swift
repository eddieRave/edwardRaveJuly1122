//
//  Network.swift
//  ToDoListPersistance
//
//  Created by Maher Damouni on 8/3/22.
//

import Foundation

//class APIManager: UIViewController, URLSessionDelegate {
//
//
//
//    init() {}
//
//    static var shared = APIManager()
//
//    func fetchToDo (completion: @escaping () -> Void) {
//
//
//        let url = URL(string: "https://www.boredapi.com/api/activity")!
//        let config = URLSessionConfiguration.default
//        let session = URLSession(configuration: config, delegate: self, delegateQueue: nil)
//
//        session.dataTask(with: url) { data, resp, error in
//            print(data ?? "")
//
//        }.resume()
//
//    }
//    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
//
//        let protectionSpace = challenge.protectionSpace
//        guard protectionSpace.authenticationMethod ==
//                NSURLAuthenticationMethodServerTrust,
//              protectionSpace.host.contains("boredapi.com") else {
//            completionHandler(.performDefaultHandling, nil)
//            return
//        }
//
//        guard let serverTrust = protectionSpace.serverTrust else {
//            completionHandler(.performDefaultHandling, nil)
//            return
//        }
//        let credential = URLCredential(trust: serverTrust)
//        completionHandler(.useCredential, credential)
//
//    }
//}
