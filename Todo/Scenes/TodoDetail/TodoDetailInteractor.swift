//
//  TodoDetailInteractor.swift
//  Todo
//
//  Created by Gurcan Yavuz on 15.09.2019.
//  Copyright © 2019 Gurcan Yavuz. All rights reserved.
//

import UIKit
import RealmSwift

protocol TodoDetailBusinessLogic
{
    func fetchTodo(request: TodoDetail.FetchTodo.Request)
}

protocol TodoDetailDataStore {
    var todo: TodoObject! { get set }
}

class TodoDetailInteractor: TodoDetailBusinessLogic, TodoDetailDataStore {
    
    var presenter: TodoDetailPresentationLogic?
    var worker = TodoDetailWorker()
    var todo: TodoObject!
    
    func fetchTodo(request: TodoDetail.FetchTodo.Request) {
        presenter?.presentTodo(response: TodoDetail.FetchTodo.Response(todo: self.todo))
    }
    
}
