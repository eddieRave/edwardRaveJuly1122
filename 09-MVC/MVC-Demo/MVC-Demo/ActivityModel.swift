//
//  ActivityModel.swift
//  MVC-Demo
//
//  Created by Rave Bizz on 7/18/22.
//

import Foundation

struct Activity: Decodable{
    let activity: String?
    let type: String?
    
    func formatType() -> String?{
        if let type = type {
            return "Type: " + type
        }
       return nil
    }
}
