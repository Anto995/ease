//
//  ShutterTableViewCell.swift
//  SOFApp
//
//  Created by Antonello Scaldaferri on 04/03/17.
//  Copyright © 2017 Antonello Scaldaferri. All rights reserved.
//

import Foundation
import UIKit

class ShutterTableViewCell: UITableViewCell {
    
    var id: String!
    @IBOutlet var myImageView: UIImageView!
    @IBOutlet var shutter: UILabel!
    @IBOutlet var room: UILabel!
    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        switch (self.mySegmentedControl.selectedSegmentIndex) {
        case 0:
            con.sendCommandAutomation(status: DeviceAutomation.STATUS.UP, id: self.id)
        case 1:
            con.sendCommandAutomation(status: DeviceAutomation.STATUS.DOWN, id: self.id)
        case 2:
            con.sendCommandAutomation(status: DeviceAutomation.STATUS.STOP, id: self.id)
        default:
            print(#function)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
