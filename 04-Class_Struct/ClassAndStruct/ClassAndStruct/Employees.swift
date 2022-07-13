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
        
        if hours + hoursWorked > 40 {
            hoursWorked = 40
        } else {
            hoursWorked += hours
        }
    }
    
    func attempt(task: inout Task) {
        
        if task.roleReq == role && hoursWorked + task.timeReq > 40 {
            task.setTimeReq(timeLeft: task.timeReq + hoursWorked - 40)
            addToHoursWorked(hours: 40)
            
        } else {
            addToHoursWorked(hours: task.timeReq)
            task.setTimeReq(timeLeft: task.timeReq - hoursWorked)
        }
    }
}
