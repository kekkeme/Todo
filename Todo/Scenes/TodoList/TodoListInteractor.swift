//
//  TodoListInteractor.swift
//  Todo
//
//  Created by Gurcan Yavuz on 15.09.2019.
//  Copyright © 2019 Gurcan Yavuz. All rights reserved.
//

import UIKit
import RealmSwift

protocol TodoListBusinessLogic
{
    func fetchTodoList(request: TodoList.Todos.Request)
    var todos: [TodoObject] { get }
}

protocol TodoListDataStore {
    var todos: [TodoObject] { get }
}

class TodoListInteractor: TodoListBusinessLogic, TodoListDataStore {
    var presenter: TodoListPresentationLogic?
    var worker = TodoListWorker()
    var todos: [TodoObject] = []
    
    func fetchTodoList(request: TodoList.Todos.Request) {
        
        guard let todos = worker.getTodos() else { return }
        self.todos = todos
        presenter?.presentTodos(response: TodoList.Todos.Response(todos: todos))
    }
   
}
