//
//  TodoListViewModel.swift
//  Todo
//
//  Created by Joel Maldonado on 8/3/22.
//

import Foundation

class TodoListViewModel: TaskDelegate {
    var todoList = [Todo]() {
        didSet {
            bindTodoList()
        }
    }
    
    var numTodos: Int {
        todoList.count
    }
    
    var bindTodoList: () -> Void = {}
    
    func addTodo(_ todo: Todo) {
        todoList.append(todo)
        saveData()
    }
    
    func getTodo(at index: Int) -> Todo{
        return todoList[index]
    }
    
    func loadData() {
        LocalDataService.shared.getTodos { todos in
            self.todoList = todos
        }
    }
    
    func saveData() {
        LocalDataService.shared.saveTodos(todoList)
    }
}
