//
//  TodoDetailController.swift
//  Todo
//
//  Created by Gurcan Yavuz on 15.09.2019.
//  Copyright © 2019 Gurcan Yavuz. All rights reserved.
//


import UIKit

protocol TodoDetailDisplayLogic: class {
    func displayTodo(viewModel: TodoDetail.FetchTodo.ViewModel)
    func displaySaveTodo()
    
}

class TodoDetailController: UIViewController, TodoDetailDisplayLogic {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    var interactor: TodoDetailBusinessLogic?
    var router: (NSObjectProtocol & TodoDetailRoutingLogic & TodoDetailDataPassing)?
    
    
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
        let interactor = TodoDetailInteractor()
        let presenter = TodoDetailPresenter()
        let router = TodoDetailRouter()
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
        interactor?.fetchTodo(request: TodoDetail.FetchTodo.Request())
    }
    
    func displayTodo(viewModel: TodoDetail.FetchTodo.ViewModel) {
        
        self.titleLabel.text = viewModel.displayedTodo.title
        self.detailLabel.text = viewModel.displayedTodo.detail
    }
    
    func displaySaveTodo() {
        router?.routeToList()
    }

    @IBAction func editPressed(_ sender: Any) {
        router?.routeToEdit()
    }
}
