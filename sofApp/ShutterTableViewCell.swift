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
    
    @IBOutlet var myImageView: UIImageView!
    @IBOutlet var shutter: UILabel!
    @IBOutlet var room: UILabel!
    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        switch (self.mySegmentedControl.selectedSegmentIndex) {
        case 0:
            print(#function)
        case 1:
            print(#function)
        case 2:
            print(#function)
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
