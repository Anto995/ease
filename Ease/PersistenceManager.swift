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
    
    static let name = "Room"
    
    static func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    
    static func createEmptyRoom() -> Room {
        let context = getContext()
        
        let room = NSEntityDescription.insertNewObject(forEntityName: name, into: context) as! Room
    
        room.name = ""
        
        return room
        
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
