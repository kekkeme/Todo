//
//  TodoDetailModels.swift
//  Todo
//
//  Created by Gurcan Yavuz on 15.09.2019.
//  Copyright © 2019 Gurcan Yavuz. All rights reserved.
//

import UIKit

enum TodoDetail
{
    // MARK: Use cases
    
    enum FetchTodo
    {
        struct Request
        {
            
        }
        struct Response
        {
            var todo: TodoObject
        }
        struct ViewModel
        {
            
            var displayedTodo: DisplayedTodo
            
            struct DisplayedTodo
            {
                var title: String
                var detail: String
                var date: String?
                
            }
        }
    }
    
}
