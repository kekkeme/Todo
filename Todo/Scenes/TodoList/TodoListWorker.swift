//
//  TodoListWorker.swift
//  Todo
//
//  Created by Gurcan Yavuz on 15.09.2019.
//  Copyright © 2019 Gurcan Yavuz. All rights reserved.
//

import Foundation
import RealmSwift


class TodoListWorker
{
    func getTodos() -> [TodoObject]? {
        
        var todos: [TodoObject] = []
        do {
            let realm = try Realm()
            let todosObject = realm.objects(TodoObject.self).sorted(byKeyPath: "date", ascending: false)
            
            
            todos = todosObject.compactMap{ $0 }
            
        } catch {
            print(error)
        }
        
        return todos
    }

}
