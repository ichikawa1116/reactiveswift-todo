//
//  ToDoCell.swift
//  reactiveswift-todo
//
//  Created by Manami Ichikawa on 2019/07/09.
//  Copyright © 2019 Manami Ichikawa. All rights reserved.
//

import UIKit

final class ToDoCell: UITableViewCell {
    @IBOutlet weak private var titleLabel: UILabel!
    
    func setup(todo: ToDo) {
        titleLabel.text = todo.title
    }
}
