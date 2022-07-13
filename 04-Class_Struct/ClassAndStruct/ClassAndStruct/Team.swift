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
        for index in taskList.indices {
            validate(taskNum: index)
        }
    }
    

    func validate(taskNum: Int) {
        for employee in employees {
            if employee.role == taskList[taskNum].roleReq {
                taskList[taskNum].setIsValid(status: true)
                assign(taskNum: taskNum, to: employee)
            }
            break
        }
    }
    
    func assign(taskNum: Int, to employee: Employee) {
        employee.attempt(task: &taskList[taskNum])
    }
    
    func allTasksCompleted() -> Bool {
        !taskList.contains(where: { !($0.isComplete) })
    }

    func weeksTillComplete() -> Int {
        var hoursRemaining: Int = 0
        let hoursInAWeek = 40 * employees.count
        
        for task in taskList {
            hoursRemaining += task.timeReq
        }

        return hoursRemaining / hoursInAWeek + (hoursRemaining % hoursInAWeek > 0 ? 1 : 0)
    }

    func printMoney() {
        if allTasksCompleted() { print("BRRRRRRRRRRRRRRRRRRRRRRRRRRRRR")}
        else { print("Tasks not completed") }
    }
    
}
