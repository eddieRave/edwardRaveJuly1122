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
        for taskNum in taskList.indices {
            validate(taskNum: taskNum)
        }
    }
    
    func validate(taskNum: Int) {
        for employee in employees {
            if employee.role == taskList[taskNum].roleReq{
                taskList[taskNum].setIsValid(status: true)
                assign(taskNum: taskNum, to: employee)
            }
        }
    }
    
    func assign(taskNum: Int, to employee: Employee) {
        employee.attempt(task: &taskList[taskNum])
    }
    
    func allTasksCompleted() -> Bool {
        var allComplete : Bool = true
        for task in taskList{
            if task.isComplete != true {
                allComplete = false
            }
        }
        return allComplete
    }
    
    func weeksTillComplete() -> Int {
        var totalHoursNeeded : Int = 0
        var hoursPossibleForThisWeek : Int = 0
        for task in taskList{
            totalHoursNeeded += task.timeReq
        }
        for employee in employees {
            var hoursLeft : Int = 0
            if employee.hoursWorked <= 40{
                hoursLeft = 40 - employee.hoursWorked
            } else {
                hoursLeft = 40
            }
           
            hoursPossibleForThisWeek += hoursLeft
        }
        
        if hoursPossibleForThisWeek < totalHoursNeeded {
           let result =  (totalHoursNeeded - hoursPossibleForThisWeek) / 40 + 1
            return result
        }
        else {
            return 1
        }
    }

    func printMoney() {
        if allTasksCompleted(){
            print("BRRRRRRRRRRRRRRRRRRRRRRRRRRRRR")
        } else {
            print("Tasks not completed")
        }
    }
    
}
