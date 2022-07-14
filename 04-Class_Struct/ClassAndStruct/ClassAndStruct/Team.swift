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
        for index in 0..<taskList.count {
            validate(taskNum: index)
        }
    }
    
    func validate(taskNum: Int) {
        for member in employees {
            if (member.role == taskList[taskNum].roleReq) {
//                taskList[taskNum].setIsComplete(status: true)
                taskList[taskNum].isValid = true
                assign(taskNum: taskNum, to: member)
            }
        }
    }
    
    func assign(taskNum: Int, to employee: Employee) {
        employee.attempt(task: &taskList[taskNum])
    }
    
    func allTasksCompleted() -> Bool {
        // TODO: still not passing test
        //
        for task in taskList {
            if (task.isComplete == true) {
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
        //
        // add validated employees to an array
        var arrayOfValidatedEmployees: [Employee] = []
        for (index, employee) in employees.enumerated() {
            if (employee.role == taskList[index].roleReq) {
                arrayOfValidatedEmployees.append(employee)
            }
        }
        // loop through array of validated employees to figure out total hours worked by team
        var hoursWorkedByTeam = 0
        for employee in employees {
            hoursWorkedByTeam += employee.hoursWorked
        }
        // sum up all task hours for that role
        var arrayOfValidatedTasks: [Task] = []
        for (index, task) in taskList.enumerated() {
            for (i, employee) in employees.enumerated() {
                if (task.roleReq == employees[i].role) {
                    arrayOfValidatedTasks.append(task)
                }
            }
        }
        var totalValidatedTaskHours = 0
        for task in arrayOfValidatedTasks {
            totalValidatedTaskHours += task.timeReq
        }
        // subtract hours worked by team from validated task hours
        let hoursThatNeedToBeWorked = totalValidatedTaskHours - hoursWorkedByTeam
        // divide above by 40
        let weeksToCompleteWork = hoursThatNeedToBeWorked / 40
        return weeksToCompleteWork
    }

    func printMoney() {
        if (allTasksCompleted() == true) {
            print("BRRRRRRRRRRRRRRRRRRRRRRRRRRRRR")
        } else {
            print("Tasks not completed")
        }
    }
    
}
