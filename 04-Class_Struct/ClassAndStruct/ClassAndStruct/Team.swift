//
//  Team.swift
//  ClassAndStruct
//
//  Created by Luat on 5/24/21.
//

import Foundation

/**
 3) Team: Manages employees and tasks
 •  Properties:
 - employees: [Employee]
 - taskList: [Task]
 • Functions
 - add(employee:)
     • adds an employee to employees array
 - add(task:)
     • adds a task to taskList
 - startWeek()
     • simulates a 40 hour work week
     • go thru team's taskList and call validate(taskNum:)
 - validate(taskNum:)
     • check if team member has roleReq
     • set task property isValid to true if valid
     • call assign(task:to) for the first appropriate employee on the team
 - assign(task: to)
     • calls employee attempt(task:)
 - weeksTillComplete(task:) -> Int
     • returns number of weeks required for the current team to complete all tasks
     •  should consider number of valid employee and their current hours worked
     •  can be called before startWeek and after startWeek
 - printMoney() should print "BRRRRRRRRRRRRRRRRRRRRRRRRRRRRR" if all tasks are completed
     •  else print "Tasks not completed"
 
 */

class Team {
    
    var employees: [Employee] = []
    var taskList: [Task] = []
    
    func add(employee: Employee) {
        employees.append(employee)
    }
    
    func add(task: Task) {
        taskList.append(task)
    }
    
    func startWeek() {
        for task in taskList.indices {
            validate(taskNum: task)
        }
    }
    
    func validate(taskNum: Int) {
        for employee in employees {
            if employee.role == taskList[taskNum].roleReq {
                taskList[taskNum].setIsValid(status: true)
                assign(taskNum: taskNum, to: employee)
            }
        }
    }
    
    func assign(taskNum: Int, to employee: Employee) {
        //documentation says & should let it work as an inout
        employee.attempt(task: &taskList[taskNum])
    }
    
    func allTasksCompleted() -> Bool {
        for task in taskList {
            //if(task.isComplete == false
            //if(task.isComplete != true {
            if(!task.isComplete) {
                return false
            }
        }
        return true
    }
    
    func weeksTillComplete() -> Int {
        var numOfRole: [Role : Int] = [:]
        
        for employee in employees {
            if let num = numOfRole[employee.role] {
                numOfRole[employee.role] = num + 1
            } else {
                numOfRole[employee.role] = 1
            }
        }
        
        var roleHours: [Role : Int] = [:]
        
        for task in taskList {
            if let num = roleHours[task.roleReq] {
                roleHours[task.roleReq] = num + task.timeReq
            } else {
                roleHours[task.roleReq] = task.timeReq
            }
        }
        
        var numOfWeeks: [Int] = []
        
        for (role, hoursReq) in roleHours {
            if let numEmployee = numOfRole[role] {
                numOfWeeks.append(hoursReq / (numEmployee * 40) + ((hoursReq % (numEmployee * 40) != 0) ? 1 : 0))
            }
        }
        
        return numOfWeeks.max() ?? 0
    }

    func printMoney() {
        //can write these statements as one line each if prefferable.
        if allTasksCompleted() {
            print("BRRRRRRRRRRRRRRRRRRRRRRRRRRRRR")
        }else{ print("Tasks not completed")
        }
    }
    
}
