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
    var timer: Timer!
    override func viewDidLoad() {
        super.viewDidLoad()
        numDevices.text = "\(room.lightInstalled.count)"
        myImageView.image = room.image
        roomFloor.text = room.floor
        if (room.tempInstalled.count == 0) {
            actualTemperature.text = "No termo"
        }
        self.title = room.name
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var roomFloor: UILabel!
    @IBOutlet var myImageView: UIImageView!
    //@IBOutlet var info: UITextField!
    @IBOutlet var numDevices: UILabel!
    @IBOutlet var actualTemperature: UILabel!
    @IBOutlet var myTableView: UITableView!
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if (favoriteLights.count + favoriteTemp.count + favoriteShutters.count) == 0{
            return 1
        } else {
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var rowCount = 0
        if section == 0 {
            if (room.lightInstalled.count == 0) {
                return 1
            } else {
               rowCount = room.lightInstalled.count
            }
            
        }
        if section == 1 {
            if (room.shutterInstalled.count == 0) {
                return 1
            } else {
                rowCount = room.shutterInstalled.count
            }
        }
        if section == 2 {
            if (room.tempInstalled.count == 0) {
                return 1
            } else {
                rowCount = room.tempInstalled.count
            }
        }
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            if (room.lightInstalled.count == 0) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath) as! DefaultTableViewCell
                cell.myLabel.text = "Add a light"
                return cell
            }
            let lightDev = room.lightInstalled[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "lightCell", for: indexPath) as! LightTableViewCell
            cell.myImageView.image = #imageLiteral(resourceName: "light")
            cell.lightPoint.text = "Light: \(lightDev.environment)\(lightDev.id)"
            cell.lightDev = lightDev
            cell.id = lightDev.id
            cell.enviroment = lightDev.environment
            if (lightDev.status == DeviceLight.STATUS.ON) {
                cell.mySwitch.isOn = true
            } else {
                cell.mySwitch.isOn = false
            }
            return cell
        } else if indexPath.section == 1 {
            if (room.shutterInstalled.count == 0) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath) as! DefaultTableViewCell
                cell.myLabel.text = "Add a shutter"
                return cell
            }
            let shutDev = room.shutterInstalled[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "shutterCell", for: indexPath) as! ShutterTableViewCell
            cell.myImageView.image = #imageLiteral(resourceName: "shutter")
            cell.shutter.text = "Shutter: \(shutDev.id)"
            cell.id = shutDev.id
            return cell
        } else {
            if (room.tempInstalled.count == 0) {
                let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath) as! DefaultTableViewCell
                cell.myLabel.text = "Add a termo"
                return cell
            }
            let tempDev = room.tempInstalled[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "termometerCell", for: indexPath) as! TermometerTableViewCell
            cell.myImageView.image = #imageLiteral(resourceName: "temp")
            cell.termometer.text = "Termo: \(tempDev.id)"
            
            cell.id = tempDev.id
            cell.myStepper.value = (Double(tempDev.actualTemperature))!/10
            cell.temperature.text = "\(cell.myStepper.value)"
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Lights"
        } else if section == 1 {
            return "Shutters"
        } else {
            return "Thermo"
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
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
        timer=Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(updateTemperature), userInfo: nil, repeats: true)
        if (room.tempInstalled.count == 0) {
            actualTemperature.text = "No termo"
        } else {
            actualTemperature.text = "\(Float((room.tempInstalled[0].actualTemperature))!/10)"
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        timer.invalidate()
    }
    func updateTemperature(){
        if (room.tempInstalled.count == 0) {
            actualTemperature.text = "No termo"
        } else {
            room.tempInstalled[0]=con.getRequestTemperature(id: room.tempInstalled[0].id)!
            actualTemperature.text = "\(Float((room.tempInstalled[0].actualTemperature))!/10)"
        }
        
    }
    

}
