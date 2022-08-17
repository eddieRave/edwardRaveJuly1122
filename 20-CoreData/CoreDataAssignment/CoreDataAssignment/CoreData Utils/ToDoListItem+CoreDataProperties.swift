//
//  ToDoListItem+CoreDataProperties.swift
//  CoreDataAssignment
//
//  Created by Rave Bizz 63 on 8/17/22.
//
//

import Foundation
import CoreData


extension ToDoListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoListItem> {
        return NSFetchRequest<ToDoListItem>(entityName: "ToDoListItem")
    }

    @NSManaged public var name: String?

}

extension ToDoListItem : Identifiable {

}
