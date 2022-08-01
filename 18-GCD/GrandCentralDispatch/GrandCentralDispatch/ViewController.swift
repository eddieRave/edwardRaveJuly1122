//
//  ViewController.swift
//  GrandCentralDispatch
//
//  Created by Rave Bizz on 8/1/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        GCDdemo().demo()
        // Do any additional setup after loading the view.
    }
    
    
    class GCDdemo{
        func demo(){
          
            

            
            
            let _: [DispatchQoS.QoSClass] = [.userInteractive, .userInitiated, .background, .utility]
            
            DispatchQueue.global(qos: .userInteractive).async {
                
                print("userInteractive")
            }
            
            DispatchQueue.global(qos: .userInitiated).async {
                print("userInitiated")
            }
            
            DispatchQueue.global(qos: .background).async {
                print("background")
            }
            
            DispatchQueue.global(qos: .utility).async {
                print("utility")
            }
            //concurent means multiple tasks can bve excuted at once
//            // serial =  one at a time
//            let queue = DispatchQueue(label: "my queue", qos: .userInitiated, attributes: .concurrent)
//            let queue1 = DispatchQueue(label: "my queue", qos: .userInitiated, attributes: .concurrent)
//            let queue2 = DispatchQueue(label: "my queue", qos: .userInitiated, attributes: .concurrent)
//
            let dispatchGroup = DispatchGroup()
             
            /*
            dispatchGroup.enter()
             dispatchGroup.enter()
             dispatchGroup.enter()
             
             callApi1(completion:{
                dispatchGroup.leave()
                })
             
              callApi1(completion:{
                 dispatchGroup.leave()
                 })
             
             
              callApi1(completion:{
                 dispatchGroup.leave()
                 })
             */
            
            //this excute closure inside the .notify method wont run until every enter has a leave called
            dispatchGroup.notify(qos: .userInteractive, queue: .global(), execute: {
                //save to core data
            })
            
            dispatchGroup.notify(queue: .main, execute: {
                //update ui
            })
            
           let operationQueue = OperationQueue()
            let operation = BlockOperation()
            let operation1 = BlockOperation()
            let operation2 = BlockOperation()
            let delayedOperation = BlockOperation()
            operation.addExecutionBlock {
                //excute task
            }
            operation1.addExecutionBlock({
                //excute
            })
            operationQueue.addOperation(operation)
            operationQueue.addOperations([operation1, operation2], waitUntilFinished: true)
            
            if operation.isExecuting{
                operation.cancel()
            }
            
            if operation1.isFinished{
                operation2.start()
            }
            operation.completionBlock = {
                delayedOperation.cancel()
            }
            
            operation1.addDependency(operation2)
            
            //race conditions tasks are excuting in an unpredictable manor
            // | solutions
            // V
            // decouple task
            // use a serial queue
            
        }
        
    }

}

