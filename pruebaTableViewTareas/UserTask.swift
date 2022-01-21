//
//  UserTask.swift
//  pruebaTableViewTareas
//
//  Created by APPS2M on 21/1/22.
//

import Foundation

class UserTask
{
    var name: String
    var course: String?
    var description: String?
    var mark: Float?
    var dueDate: Date?
    var performDate: Date?
    var subtasks: [UserSubtask?]
    var done: Bool
    
    init(name: String, course: String?, description: String?, mark: Float?, dueDate: Date?, performDate: Date?, done: Bool)
    {
        self.name = name
        self.course = course
        self.description = description
        self.mark = mark
        self.dueDate = dueDate
        self.performDate = performDate
        self.subtasks = []
        self.done = done
    }
}

class UserSubtask
{
    var name: String
    var performDate: Date?
    var done: Bool
    
    init(name: String, performDate: Date?, done: Bool)
    {
        self.name = name
        self.performDate = performDate
        self.done = done
    }
}
