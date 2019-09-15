//
//  TodoListPresenter.swift
//  Todo
//
//  Created by Gurcan Yavuz on 15.09.2019.
//  Copyright © 2019 Gurcan Yavuz. All rights reserved.
//

import UIKit

protocol TodoListPresentationLogic {
    func presentTodos(response: TodoList.Todos.Response)
}

class TodoListPresenter: TodoListPresentationLogic {
    
    weak var viewController: TodoListDisplayLogic?
    
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy - HH:mm"
        return dateFormatter
    }()
    
    
    func presentTodos(response: TodoList.Todos.Response) {
        
        
        var displayedTodos: [TodoList.Todos.ViewModel.DisplayedTodo] = []
        for todo in response.todos {
            
            let model = TodoList.Todos.ViewModel.DisplayedTodo(
                title: todo.title,
                detail: todo.detail,
                date: dateFormatter.string(from: todo.date)
            )
            
            displayedTodos.append(model)
        }
        
        
        viewController?.displayTodos(viewModel: TodoList.Todos.ViewModel(displayedTodos: displayedTodos))
    }
    
}
