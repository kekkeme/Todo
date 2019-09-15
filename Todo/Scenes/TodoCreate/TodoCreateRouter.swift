//
//  TodoCreateRouter.swift
//  Todo
//
//  Created by Gurcan Yavuz on 15.09.2019.
//  Copyright © 2019 Gurcan Yavuz. All rights reserved.
//


import UIKit

@objc protocol TodoCreateRoutingLogic
{
    func routeToList()
    
}

protocol TodoCreateDataPassing
{
    var dataStore: TodoCreateDataStore? { get }
}

class TodoCreateRouter: NSObject, TodoCreateRoutingLogic, TodoCreateDataPassing
{
    
    var dataStore: TodoCreateDataStore?
    
    weak var viewController: TodoCreateController?
    
    func routeToList() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
