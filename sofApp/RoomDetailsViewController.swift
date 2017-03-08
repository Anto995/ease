//
//  RoomDetailsViewController.swift
//  sofApp
//
//  Created by Antonio Scialdone on 06/03/2017.
//  Copyright © 2017 Antonio Scialdone. All rights reserved.
//

import UIKit

class RoomDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var room: Room!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBOutlet weak var roomName: UILabel!
    @IBOutlet var myImageView: UIImageView!
    //@IBOutlet var info: UITextField!
    @IBOutlet var numDevices: UILabel!
    @IBOutlet var actualTemperature: UILabel!
    @IBOutlet var myTableView: UITableView!
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       return room.lightInstalled.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let lightDev = room.lightInstalled[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "lightCell", for: indexPath) as! LightTableViewCell
        cell.myImageView.image = #imageLiteral(resourceName: "light")
        cell.lightPoint.text = "Light: \(lightDev.environment)\(lightDev.id)"
        
        cell.id = lightDev.id
        cell.enviroment = lightDev.environment
        if (lightDev.status == DeviceLight.STATUS.ON) {
            cell.mySwitch.isOn = true
        } else {
            cell.mySwitch.isOn = false
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let more = UITableViewRowAction(style: .default, title: "Favorite") { action, index in
            favoriteLights.append(self.room.lightInstalled[indexPath.row])
            
        }
        more.backgroundColor = .lightGray
        return [more]
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let dstView = segue.destination as! DevicesViewController
        dstView.room = room
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.myTableView.reloadData()
    }

}
