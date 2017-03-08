//
//  Room.swift
//  sofApp
//
//  Created by Antonio Scialdone on 06/03/2017.
//  Copyright © 2017 Antonio Scialdone. All rights reserved.
//

import Foundation
import UIKit
class Room {
    
    var name: String?
    var id: Int?
    var image: UIImage?
    var lightInstalled = [DeviceLight]()
    var tempInstalled = [DeviceThermoregulation]()
    var shutterInstalled = [DeviceAutomation]()
    
    init(name: String, identifier: Int) {
        self.name = name
        id = identifier
        switch identifier {
        case 1:
            self.image = #imageLiteral(resourceName: "bathroom")
        case 2:
            self.image = #imageLiteral(resourceName: "bedroom")
        case 3:
            self.image = #imageLiteral(resourceName: "kitchen")
        case 4:
            self.image = #imageLiteral(resourceName: "double room")
        case 5:
            self.image = #imageLiteral(resourceName: "livingroom")
        case 6:
            self.image = #imageLiteral(resourceName: "other")
        default:
            print(#function)
        }
    }
    
}
