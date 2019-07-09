//
//  Todo.swift
//  reactiveswift-todo
//
//  Created by Manami Ichikawa on 2019/07/10.
//  Copyright © 2019 Manami Ichikawa. All rights reserved.
//

import Foundation
import RealmSwift

public struct ToDo {
    
    public let todoID: Int
    public let title: String
    public let contents: String
    public let isCompleted: Bool
    public let updateDate: Date?
    
    public init(todoID: Int,
                title: String,
                contents: String,
                isCompleted: Bool,
                updateDate: Date?) {
        
        self.todoID = todoID
        self.title = title
        self.contents = contents
        self.isCompleted = isCompleted
        self.updateDate = updateDate
    }
    
    func asRealm() -> ToDoEntity {
        return ToDoEntity.build { object in
            object.todoID = todoID
            object.title = title
            object.contents = contents
            object.isCompleted = isCompleted
            object.updateDate = updateDate
        }
    }
}
