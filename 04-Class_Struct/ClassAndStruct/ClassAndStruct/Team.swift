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
        for (i,_) in taskList.enumerated() {
            validate(taskNum: i)
        }
    }
    
    func validate(taskNum: Int) {
        for(i,_) in employees.enumerated() {
            if employees[i].role == taskList[i].roleReq {
                taskList[i].setIsValid(status: true)
                assign(taskNum: taskNum, to: employees[i])
            }
        }
        
    }
    
    func assign(taskNum: Int, to employee: Employee) {
        employee.attempt(task: &taskList[taskNum])
    }
    
    func allTasksCompleted() -> Bool {
        for i in taskList {
            if i.isComplete == false {
                return false
            }
        }
        return true
    }
    
    // Needs to be worked on
    // returns number of weeks required for the current team to complete all tasks
    // Consider valid number of employees and their hours worked
    func weeksTillComplete() -> Int {
        
        var validEmployees = 0
        var totalHours = 0
        
        // Loop through task array
        for i in taskList {
            if i.isValid {
                validEmployees += 1
            }
        }
        
        // Loop through employees array
        for i in employees {
            totalHours += i.hoursWorked
        }
        print("totalHours = ",totalHours)
        print("validEmployees = ", validEmployees)
        let result = totalHours + validEmployees
        print("result = ", result)
        return result
    }

    func printMoney() {
        // Using ternary operator since there are only two possibilities
        allTasksCompleted() == true ? print("BRRRRRRRRRRRRRRRRRRRRRRRRRRRRR") : print("Tasks not completed")
    }
    
}

