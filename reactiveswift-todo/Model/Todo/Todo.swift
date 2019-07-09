//
//  Todo.swift
//  reactiveswift-todo
//
//  Created by Manami Ichikawa on 2019/07/10.
//  Copyright © 2019 Manami Ichikawa. All rights reserved.
//

import Foundation

public struct Todo {
    
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
}
