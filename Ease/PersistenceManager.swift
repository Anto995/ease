//
//  PersistenceManager.swift
//  Ease
//
//  Created by Antonio Scialdone on 28/02/2017.
//  Copyright © 2017 Antonio Scialdone. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class PersistenceManager {
    
    
    
    static func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    
    static func createEmptyRoom() {
        let context = getContext()
        
        let room = NSEntityDescription.insertNewObject(forEntityName: "Room", into: context) as! Room
        let device = NSEntityDescription.insertNewObject(forEntityName: "Device", into: context) as! Device
        
        room.name = ""
        device.id = 0
        device.name = ""
        
        device.is_contained = room
        
        saveContext()
        
    }
    
    static func fetchData() -> [Room] {
        
        var rooms = [Room]()
        
        let context = getContext()
        
        let fetchRequest = NSFetchRequest<Room>(entityName: "Room")
        
        do {
            try rooms = context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Error in fetch \(error.code)")
        }
        
        return rooms
        
    }
    
    
    static func saveContext() {
        let context = getContext()
        do {
            try context.save()
        } catch let error as NSError {
            print("Error in save \(error)")
        }
    }
}
