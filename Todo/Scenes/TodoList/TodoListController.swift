//
//  TodoListController.swift
//  Todo
//
//  Created by Gurcan Yavuz on 15.09.2019.
//  Copyright © 2019 Gurcan Yavuz. All rights reserved.
//

import UIKit

protocol TodoListDisplayLogic: class {
    func displayTodos(viewModel: TodoList.Todos.ViewModel)
    
}

class TodoListController: UIViewController, TodoListDisplayLogic {
    var interactor: TodoListBusinessLogic?
    var router: (NSObjectProtocol & TodoListRoutingLogic & TodoListDataPassing)?
    
    var displayedTodos: [TodoList.Todos.ViewModel.DisplayedTodo] = []
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var emptyView: UIView!
    
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
        let interactor = TodoListInteractor()
        let presenter = TodoListPresenter()
        let router = TodoListRouter()
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
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchTodos()
        checkTodosForUI()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
    }
    
    func checkTodosForUI() {
        let isEmpty = displayedTodos.isEmpty
        tableView.isHidden = isEmpty
        emptyView.isHidden = !isEmpty
    }
    
    func fetchTodos() {
        interactor?.fetchTodoList(request: TodoList.Todos.Request())
    }
    
    func displayTodos(viewModel: TodoList.Todos.ViewModel) {
        displayedTodos = viewModel.displayedTodos
        tableView.reloadData()
    }
    
    
    @IBAction func addPressed(_ sender: Any) {
        router?.routeToCreate()
    }
}

extension TodoListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedTodos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let displayedTodo = displayedTodos[indexPath.row]
        let cell = TodoTableViewCell.create(tableView: tableView, indexPath: indexPath, model: displayedTodo)
        cell.bind(model: displayedTodo)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TodoTableViewCell.height
    }
}

extension TodoListController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.routeToDetail(index: indexPath.row)
    }
}

