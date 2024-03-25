//
//  Item+CoreDataProperties.swift
//  Devote-Todo
//
//  Created by SMIT KHOKHARIYA on 2024-03-19.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var timestamp: Date?
    @NSManaged public var task: String?

}

extension Item : Identifiable {

}
