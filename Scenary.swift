//
//  Scenary.swift
//  sofApp
//
//  Created by Antonio Scialdone on 06/03/2017.
//  Copyright © 2017 Antonio Scialdone. All rights reserved.
//

import Foundation
import UIKit

class Scenary {
    
    var name: String?
    var startDate: Date?
    var endDate: Date?
    var image: UIImage?
    var lightInstalled = [DeviceLight]()
    var tempInstalled = [DeviceThermoregulation]()
    var shutterInstalled = [DeviceAutomation]()
    
    init(name: String, startDate: Date, endDate: Date, image: UIImage) {
        self.name = name
        self.startDate = startDate
        self.endDate = endDate
        self.image = image
     
    }
    
    init() {
        
    }
}
