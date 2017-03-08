//
//  LightTableViewCell.swift
//  sofApp
//
//  Created by Antonio Scialdone on 06/03/2017.
//  Copyright © 2017 Antonio Scialdone. All rights reserved.
//

import UIKit

class LightTableViewCell: UITableViewCell {
    var id: String!
    var enviroment: String!
    @IBOutlet var myImageView: UIImageView!
    @IBOutlet var lightPoint: UILabel!
    @IBOutlet var room: UILabel!
    @IBOutlet var mySwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    @IBAction func switchOnOff(_ sender: UISwitch) {
        if mySwitch.isOn {
            con.sendCommandLights(status: DeviceLight.STATUS.ON, environment: self.enviroment, id: self.id)
        } else {
            con.sendCommandLights(status: DeviceLight.STATUS.OFF, environment: self.enviroment, id: self.id)
        }
    }
    
    

}
