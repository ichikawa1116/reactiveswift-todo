//
//  ToDoViewModel.swift
//  reactiveswift-todo
//
//  Created by Manami Ichikawa on 2019/07/10.
//  Copyright © 2019 Manami Ichikawa. All rights reserved.
//

import Foundation
import ReactiveSwift
import Result

final class ToDoViewModel {
    let todos = MutableProperty<[ToDo]>([])
    // TODO: DI
    private let repository = ToDoRepository()
    
    init() {
    }

    private func fetchAll(){
        todos.value = repository.fetch()
    }
}

extension ToDoViewModel {
    
    func numberOfItems(in section: Int) -> Int {
        return todos.value.count
    }
    
    func item(at indexPath: IndexPath) -> ToDo {
        return todos.value[indexPath.row]
    }
}
