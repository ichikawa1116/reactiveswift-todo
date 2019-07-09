//
//  ToDoDao.swift
//  reactiveswift-todo
//
//  Created by Manami Ichikawa on 2019/07/10.
//  Copyright © 2019 Manami Ichikawa. All rights reserved.
//

import Foundation
import RealmSwift

protocol ToDoRepositoryProtocol {
    // TODO: what to pass as arguments
    func save(title: String, content: String, isCompleted: Bool)
    func fetch() -> [ToDo]
}

struct ToDoRepository: ToDoRepositoryProtocol {
    let realm = RealmHelper<ToDoEntity>()
    
    func save(title: String, content: String, isCompleted: Bool) {
        let object = ToDo(todoID: realm.newId()!,
                          title: title,
                          contents: content,
                          isCompleted: isCompleted,
                          updateDate: Date()).asRealm()
        
        return realm.add(data: object)
    }
    
    func fetch() -> [ToDo] {
        return realm.findAll()
            .map { $0.asDomain() }
    }
}
