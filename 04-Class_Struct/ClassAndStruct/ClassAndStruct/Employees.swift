//
//  Employees.swift
//  ClassAndStruct
//
//  Created by Luat on 5/24/21.
//

import Foundation

/**
 2) Employee (class)
 • Properties:
 - payRate: PayRate (enum)
 - role: Role (enum)
 - hoursWorked: Int
 • Can't work more than 40 hours a week
 •  Functions
 - init Function ()
 - attempt(task: Task)
     • Task can be attempted if employee has same Role as task
     • Add the hours required to finish task to employee's hoursWorked (up to 40)
     • Reduce the task's timeReq to 0 if possible, or by num hours worked
 */

class Employee {
    var payRate: PayRate
    var role: Role
    var hoursWorked: Int = 0
        
    init(role: Role, payRate: PayRate) {
        self.role = role
        self.payRate = payRate
    }
    
    func addToHoursWorked(hours: Int) {
        hoursWorked += hours
    }
    
    func attempt(task: inout Task) {
        var timeAvailable : Int = 40 - hoursWorked
        
        if task.roleReq == role{
            if timeAvailable >= task.timeReq {
                addToHoursWorked(hours: task.timeReq)
                task.setIsValid(status: true)
                task.setIsComplete(status: true)
                task.setTimeReq(timeLeft: 0)
            } else {
                    let timeLeft = task.timeReq - timeAvailable
                    addToHoursWorked(hours: timeAvailable)
                    task.setIsValid(status: true)
//                    task.setIsComplete(status: true)
                    task.setTimeReq(timeLeft: timeLeft)
    
                }
                
            }
            
        }
        
    
}
