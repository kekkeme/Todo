//
//  TodoListModels.swift
//  Todo
//
//  Created by Gurcan Yavuz on 15.09.2019.
//  Copyright © 2019 Gurcan Yavuz. All rights reserved.
//

import UIKit

enum TodoList
{
    // MARK: Use cases
    
    enum Todos
    {
        struct Request
        {
            
        }
        struct Response
        {
            var todos: [TodoObject]
        }
        struct ViewModel
        {
            
            var displayedTodos: [DisplayedTodo]
            
            struct DisplayedTodo
            {
                var title: String
                var detail: String
                var date: String?
               
            }
        }
    }

}
