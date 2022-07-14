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
    
    // TODO: init
    
    func add(employee: Employee) {
        employees.append(employee)
    }
    
    func add(task: Task) {
        taskList.append(task)
    }
    
    func startWeek() {
        // TODO: simulates a 40 hour work week
        // TODO: go thru team's taskList and call validate(taskNum:)
    }
    
    func validate(taskNum: Int) {
        for member in employees {
            if member.role == taskList[taskNum].roleReq {
                taskList[taskNum].isValid = true
                // TODO: call assign(task:to) for the first appropriate employee on the team
            }
        }
    }
    
    func assign(taskNum: Int, to employee: Employee) {
        // TODO: calls employee attempt(task:)
    }
    
    func allTasksCompleted() -> Bool {
        for task in taskList {
            if task.isComplete == true {
                continue
            } else {
                return false
            }
        }
        return true
    }
    
    func weeksTillComplete() -> Int {
        // TODO: returns number of weeks required for the current team to complete all tasks
        // TODO: should consider number of valid employee and their current hours worked
        // TODO: can be called before startWeek and after startWeek
        return 0
    }

    func printMoney() {
        if allTasksCompleted() == true {
            print("BRRRRRRRRRRRRRRRRRRRRRRRRRRRRR")
        } else {
            print("Tasks not completed")
        }
    }
    
}
