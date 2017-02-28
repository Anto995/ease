//
//  Room+CoreDataProperties.swift
//  Ease
//
//  Created by Antonio Scialdone on 28/02/2017.
//  Copyright © 2017 Antonio Scialdone. All rights reserved.
//

import Foundation
import CoreData


extension Room {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Room> {
        return NSFetchRequest<Room>(entityName: "Room");
    }

    @NSManaged public var name: String?
    @NSManaged public var contains: NSSet?

}

// MARK: Generated accessors for contains
extension Room {

    @objc(addContainsObject:)
    @NSManaged public func addToContains(_ value: Device)

    @objc(removeContainsObject:)
    @NSManaged public func removeFromContains(_ value: Device)

    @objc(addContains:)
    @NSManaged public func addToContains(_ values: NSSet)

    @objc(removeContains:)
    @NSManaged public func removeFromContains(_ values: NSSet)

}
