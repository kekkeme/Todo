//
//  TodoCreateInteractor.swift
//  Todo
//
//  Created by Gurcan Yavuz on 15.09.2019.
//  Copyright © 2019 Gurcan Yavuz. All rights reserved.
//

import UIKit
import RealmSwift

protocol TodoCreateBusinessLogic
{
    func fetchTodo(request: TodoCreate.FetchTodo.Request)
    func saveTodo(request: TodoCreate.SaveTodo.Request)
}

protocol TodoCreateDataStore {
    var todo: TodoObject! { get set }
}

class TodoCreateInteractor: TodoCreateBusinessLogic, TodoCreateDataStore {

    
    var presenter: TodoCreatePresentationLogic?
    var worker = TodoCreateWorker()
    var todo: TodoObject! = {
        let todo = TodoObject()
        todo.title = ""
        todo.detail = ""
        return todo
    }()
    
    func fetchTodo(request: TodoCreate.FetchTodo.Request) {
        presenter?.presentTodo(response: TodoCreate.FetchTodo.Response(todo: self.todo))
    }
    
    func saveTodo(request: TodoCreate.SaveTodo.Request) {
        
        // you can check is valid texts are valid
        do {
            let realm = try Realm()
            

            
            try realm.write {
                todo.title = request.title
                todo.detail = request.detail
                todo.date = Date()
                realm.add(todo)
                presenter?.presentSaveTodo()
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
