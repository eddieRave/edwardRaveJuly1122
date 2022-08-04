//
//  ApiManager.swift
//  ToDoApp
//
//  Created by Spencer Hurd on 8/3/22.
//

import Foundation

class ApiManager: NSObject {
    
    static let shared = ApiManager()
    
    func fetchData(completion: @escaping (Task)->Void) {
        
        guard let url = URL(string: "https://www.boredapi.com/api/activity/") else {
            return
        }
        
        // Fix insecure access to bored API
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config, delegate: self, delegateQueue: nil)
        session.dataTask(with: url) { data, response, error in
            print(data ?? "")
        }.resume()
        
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            if let data = data {
//                print("|||||||| Data is called in URLSession", data)
                do {
                    let  model = try JSONDecoder().decode(Task.self, from: data)
                    completion(model)
                } catch  {
                    print("error")
                }
            }
        })
        task.resume()
        
    }
    
}

extension ApiManager: URLSessionDelegate {
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
