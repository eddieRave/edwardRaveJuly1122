//
//  Network.swift
//  ToDoListPersistance
//
//  Created by Maher Damouni on 8/3/22.
//

import Foundation

final class APIManager: NSObject {
    
    static var shared = APIManager()
    
    func fetchToDo (completion: @escaping (RandomTodo) -> Void) {
        
        guard let url = URL(string: "https://www.boredapi.com/api/activity") else { return }
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config, delegate: self, delegateQueue: nil)
        session.dataTask(with: url) { data, res, error in
            print(data ?? " ")
        }.resume()
        
        session.dataTask(with: url) { data, res, error in
            
            guard let data = data else { return }
            
            do {
                let decodedData = try JSONDecoder().decode(RandomTodo.self, from: data)
                print(decodedData)
                completion(decodedData)
            }catch {
                print("error", error)
            }
            
        }.resume()
    }
}

extension APIManager: URLSessionDelegate {
    
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

struct RandomTodo: Decodable {
    
  var activity: String
}
