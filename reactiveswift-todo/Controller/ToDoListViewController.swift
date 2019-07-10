//
//  ViewController.swift
//  reactiveswift-todo
//
//  Created by Manami Ichikawa on 2019/07/06.
//  Copyright © 2019 Manami Ichikawa. All rights reserved.
//

import UIKit
import ReactiveSwift

final class ToDoListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.register(
                UINib(
                    nibName: "ToDoCell",
                    bundle: nil),
                forCellReuseIdentifier: "ToDoCell")
            // to remove extra separator lines
            tableView.tableFooterView = UIView()
            // to remove separator insets
            tableView.separatorInset = UIEdgeInsets.zero
            tableView.separatorStyle = .singleLine
        }
    }
    
    private let viewModel: ToDoViewModel
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(viewModel: ToDoViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.todos.signal.observeValues { [weak self] _ in
            self?.tableView.reloadData()
        }
        // TODO: hide this operator from VC
        viewModel.fetchAll()
    }
}

extension ToDoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "ToDoCell",
            for: indexPath) as! ToDoCell
        cell.setup(todo: viewModel.item(at: indexPath))
        return cell
    }
}

