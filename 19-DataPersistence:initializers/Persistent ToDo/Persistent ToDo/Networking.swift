//
//  Networking.swift
//  Persistent ToDo
//
//  Created by Rave Bizz 63 on 8/5/22.
//

import Foundation

final class Networking: NSObject {
    
    static var shared = Networking()
    
    func fetchToDo (completion: @escaping (RandomTask) -> Void) {
        
        guard let url = URL(string: "https://www.boredapi.com/api/activity") else { return }
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config, delegate: self, delegateQueue: nil)
        session.dataTask(with: url) { data, response, error in
            print(data ?? "")
        }.resume()
        
        session.dataTask(with: url) { data, response, error in
            
            guard let data = data else { return }
            
            do {
                let APIdata = try JSONDecoder().decode(RandomTask.self, from: data)
                print(APIdata)
                completion(APIdata)
            } catch {
                print("error: ", error)
            }
        }.resume()
    }
}

extension Networking: URLSessionDelegate {
    
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        
        let protectionSpace = challenge.protectionSpace
        guard protectionSpace.authenticationMethod ==
                NSURLAuthenticationMethodServerTrust,
              protectionSpace.host.contains("boredapi.com") else {
            completionHandler(.performDefaultHandling, nil)
            return
        }
        
        guard let serverTrust = protectionSpace.serverTrust else {
            completionHandler(.performDefaultHandling, nil)
            return
        }
        let credential = URLCredential(trust: serverTrust)
        completionHandler(.useCredential, credential)
        
    }
}

struct RandomTask: Decodable {
    var activity: String
}
