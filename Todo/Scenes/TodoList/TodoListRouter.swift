//
//  TodoListRouter.swift
//  Todo
//
//  Created by Gurcan Yavuz on 15.09.2019.
//  Copyright © 2019 Gurcan Yavuz. All rights reserved.
//

import UIKit

@objc protocol TodoListRoutingLogic
{
    func routeToDetail(index: Int)
    func routeToCreate()

}

protocol TodoListDataPassing
{
    var dataStore: TodoListDataStore? { get }
}

class TodoListRouter: NSObject, TodoListRoutingLogic, TodoListDataPassing
{
    
    var dataStore: TodoListDataStore?
    
    weak var viewController: TodoListController?
    
    func routeToDetail(index: Int) {
        let storyboard = UIStoryboard(name: "TodoDetail", bundle: nil)
        if let destinationVC = storyboard.instantiateViewController(withIdentifier: "TodoDetailController") as? TodoDetailController {
            var destinationDS = destinationVC.router!.dataStore!
            
            passDataToTodoDetail(todo: dataStore!.todos[index], destination: &destinationDS)
            navigateToTodoDetail(source: viewController!, destination: destinationVC)
        }
    }
    
    func routeToCreate() {
        let storyboard = UIStoryboard(name: "TodoCreate", bundle: nil)
        if let destinationVC = storyboard.instantiateViewController(withIdentifier: "TodoCreateController") as? TodoCreateController {
            navigateToCreateTodo(source: viewController!, destination: destinationVC)
        }
    }
    
    // MARK: Navigation
    
    func navigateToCreateTodo(source: TodoListController, destination: TodoCreateController) {
        source.show(destination, sender: nil)
    }
    
    func navigateToTodoDetail(source: TodoListController, destination: TodoDetailController) {
        source.show(destination, sender: nil)
    }
    
    //MARK: Passing data
    
    func passDataToTodoDetail(todo: TodoObject, destination: inout TodoDetailDataStore) {
        
        destination.todo = todo
    }
//
//    func passDataToCreateFax(receipt: FaxReceiptObject, faxDocument: FaxDocument, destination: inout SendFaxDataStore) {
//
//        destination.recipientNumber = receipt.recipient
//        destination.senderName = receipt.senderName
//        destination.senderPhoneNumber = receipt.senderPhoneNumber
//        destination.countryCode = receipt.recipientCountryCode
//        destination.documentContent?.append(faxDocument)
//    }
}
