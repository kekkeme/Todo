//
//  TodoCreatePresenter.swift
//  Todo
//
//  Created by Gurcan Yavuz on 15.09.2019.
//  Copyright © 2019 Gurcan Yavuz. All rights reserved.
//

import UIKit

protocol TodoCreatePresentationLogic {
    func presentTodo(response: TodoCreate.FetchTodo.Response)
    func presentSaveTodo()
}

class TodoCreatePresenter: TodoCreatePresentationLogic {
    
    weak var viewController: TodoCreateDisplayLogic?
    
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy - HH:mm"
        return dateFormatter
    }()
    
    func presentTodo(response: TodoCreate.FetchTodo.Response) {
        
        let model = TodoCreate.FetchTodo.ViewModel.DisplayedTodo(
            title: response.todo.title,
            detail: response.todo.detail,
            date: dateFormatter.string(from: response.todo.date)
        )
        
        viewController?.displayTodo(viewModel: TodoCreate.FetchTodo.ViewModel(displayedTodo: model))
    }
  
    func presentSaveTodo() {
        viewController?.displaySaveTodo()
    }
}
