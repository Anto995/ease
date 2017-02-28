//
//  RoomCell.swift
//  Ease
//
//  Created by Roberto Palladino on 28/02/2017.
//  Copyright © 2017 Antonio Scialdone. All rights reserved.
//

import UIKit

class RoomCell: UITableViewCell {

    @IBOutlet weak var devNumber: UILabel!
    @IBOutlet weak var roomName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        

        // Configure the view for the selected state
    }

    
}
