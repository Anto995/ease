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
    
    static let name = "Rooms"
    
    static func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    
    
}
