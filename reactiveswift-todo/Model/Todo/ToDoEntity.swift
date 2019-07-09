//
//  RTodo.swift
//  reactiveswift-todo
//
//  Created by Manami Ichikawa on 2019/07/10.
//  Copyright © 2019 Manami Ichikawa. All rights reserved.
//

import Foundation
import RealmSwift

class ToDoEntity: Object {
    
    @objc dynamic var todoID = 0
    @objc dynamic var title = ""
    @objc dynamic var contents = ""
    @objc dynamic var isCompleted = false
    @objc dynamic var updateDate: Date?
    
    override static func primaryKey() -> String? {
        return "todoID"
    }
    
    func asDomain() -> ToDo {
        return ToDo(todoID: todoID,
                    title: title,
                    contents: contents,
                    isCompleted: isCompleted,
                    updateDate: updateDate)
    }
}
