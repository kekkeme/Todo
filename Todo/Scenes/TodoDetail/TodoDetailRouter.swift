//
//  TodoDetailRouter.swift
//  Todo
//
//  Created by Gurcan Yavuz on 15.09.2019.
//  Copyright © 2019 Gurcan Yavuz. All rights reserved.
//


import UIKit

@objc protocol TodoDetailRoutingLogic
{
    func routeToList()
    func routeToEdit()
    
}

protocol TodoDetailDataPassing
{
    var dataStore: TodoDetailDataStore? { get }
}

class TodoDetailRouter: NSObject, TodoDetailRoutingLogic, TodoDetailDataPassing
{
    
    var dataStore: TodoDetailDataStore?
    
    weak var viewController: TodoDetailController?
    
    func routeToList() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    
    func routeToEdit() {
        let storyboard = UIStoryboard(name: "TodoCreate", bundle: nil)
        if let destinationVC = storyboard.instantiateViewController(withIdentifier: "TodoCreateController") as? TodoCreateController {
            var destinationDS = destinationVC.router!.dataStore!
            
            passDataToTodoCreate(todo: dataStore!.todo, destination: &destinationDS)
            navigateToTodoCreate(source: viewController!, destination: destinationVC)
        }
    }
    
    func passDataToTodoCreate(todo: TodoObject, destination: inout TodoCreateDataStore) {
        destination.todo = todo
    }
    
    func navigateToTodoCreate(source: TodoDetailController, destination: TodoCreateController) {
        source.show(destination, sender: nil)
        
    }
}
