//
//  TodoDetailPresenter.swift
//  Todo
//
//  Created by Gurcan Yavuz on 15.09.2019.
//  Copyright © 2019 Gurcan Yavuz. All rights reserved.
//

import UIKit

protocol TodoDetailPresentationLogic {
    func presentTodo(response: TodoDetail.FetchTodo.Response)
    func presentSaveTodo()
}

class TodoDetailPresenter: TodoDetailPresentationLogic {
    
    weak var viewController: TodoDetailDisplayLogic?
    
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy - HH:mm"
        return dateFormatter
    }()
    
    func presentTodo(response: TodoDetail.FetchTodo.Response) {
        
        let model = TodoDetail.FetchTodo.ViewModel.DisplayedTodo(
            title: response.todo.title,
            detail: response.todo.detail,
            date: dateFormatter.string(from: response.todo.date)
        )
        
        viewController?.displayTodo(viewModel: TodoDetail.FetchTodo.ViewModel(displayedTodo: model))
    }
  
    func presentSaveTodo() {
        viewController?.displaySaveTodo()
    }
}
