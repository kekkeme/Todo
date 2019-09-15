//
//  TodoCreateController.swift
//  Todo
//
//  Created by Gurcan Yavuz on 15.09.2019.
//  Copyright © 2019 Gurcan Yavuz. All rights reserved.
//


import UIKit

protocol TodoCreateDisplayLogic: class {
    func displayTodo(viewModel: TodoCreate.FetchTodo.ViewModel)
    func displaySaveTodo()
    
}

class TodoCreateController: UIViewController, TodoCreateDisplayLogic {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var detailTextField: UITextField!
    var interactor: TodoCreateBusinessLogic?
    var router: (NSObjectProtocol & TodoCreateRoutingLogic & TodoCreateDataPassing)?
  
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    private func setup() {
        let viewController = self
        let interactor = TodoCreateInteractor()
        let presenter = TodoCreatePresenter()
        let router = TodoCreateRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchTodo()
    }

    
    func fetchTodo() {
        interactor?.fetchTodo(request: TodoCreate.FetchTodo.Request())
    }
    
    func displayTodo(viewModel: TodoCreate.FetchTodo.ViewModel) {
        
        titleTextField.text = viewModel.displayedTodo.title
        detailTextField.text = viewModel.displayedTodo.detail
    }
    
    func displaySaveTodo() {
        router?.routeToList()
    }

    @IBAction func savePressed(_ sender: Any) {
        interactor?.saveTodo(request: TodoCreate.SaveTodo.Request(
            title: titleTextField.text ?? "",
            detail: detailTextField.text ?? ""
        ))
    }
}
