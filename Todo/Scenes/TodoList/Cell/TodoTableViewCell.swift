//
//  TodoTableViewCell.swift
//  Todo
//
//  Created by Gurcan Yavuz on 15.09.2019.
//  Copyright © 2019 Gurcan Yavuz. All rights reserved.
//

import UIKit


class TodoTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var detailLabel: UILabel!
    
    static let reuseIdentifiler = "TodoTableViewCell"
    static let height: CGFloat = 80
    
    var model: TodoList.Todos.ViewModel.DisplayedTodo!

    
    func bind(model:  TodoList.Todos.ViewModel.DisplayedTodo) {
        self.model = model
        //dateLabel.text = model.date.description
        
        titleLabel.text = model.title
        detailLabel.text = model.detail
    }
    

    static func create(tableView: UITableView, indexPath: IndexPath,
                       model: TodoList.Todos.ViewModel.DisplayedTodo) -> TodoTableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodoTableViewCell.reuseIdentifiler, for: indexPath) as? TodoTableViewCell else {
            fatalError("Cell is nil")
        }
        
        cell.bind(model: model)
        return cell
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
}
