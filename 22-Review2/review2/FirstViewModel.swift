//
//  FirstViewModel.swift
//  review2
//
//  Created by Rave Bizz on 8/5/22.
//

import Foundation

class ViewModel {
    
    var helper = Helper()
    
    func start() {
        print("start of ViewModel.start()")
        helper.uppercaseData(input: "July Batch", processCompletion: { finalResult in
            print(finalResult)
        })
    }
}
