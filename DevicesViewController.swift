//
//  DevicesViewController.swift
//  sofApp
//
//  Created by Antonio Scialdone on 08/03/2017.
//  Copyright © 2017 Antonio Scialdone. All rights reserved.
//

import UIKit




class DevicesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var room: Room!
    var lightsNotInstalled: [DeviceLight]!
    var roomLights: [DeviceLight]!
    var roomShutters: [DeviceAutomation]!
    var roomTemp: [DeviceThermoregulation]!
    
    @IBOutlet weak var myTableView: UITableView!
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath.section)
        if indexPath.section == 0 {
            let lightDev = roomLights[indexPath.row]
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
            let shutDev = roomShutters[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "shutterCell", for: indexPath) as! ShutterTableViewCell
            cell.myImageView.image = #imageLiteral(resourceName: "shutter")
            cell.shutter.text = "Shutter: \(shutDev.id)"
            return cell
        } else {
            
            let tempDev = roomTemp[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "termometerCell", for: indexPath) as! TermometerTableViewCell
            cell.myImageView.image = #imageLiteral(resourceName: "temp")
            cell.termometer.text = "Termo: \(tempDev.id)"
            cell.temperature.text = "\(tempDev.actualTemperature)"
            cell.id = tempDev.id
            return cell
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(section)
        var rowCount = 0
        if section == 0 {
            rowCount = roomLights.count
        }
        if section == 1 {
            rowCount = roomShutters.count
        }
        if section == 2 {
            rowCount = roomTemp.count
        }
        return rowCount
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        allLights1.removeAll()
        allLights1.formUnion(con.getRequestLights())
        allTemp2.removeAll()
        allTemp2.insert(con.getRequestTemperature(id: "1")!)
        allTemp2.insert(con.getRequestTemperature(id: "2")!)
        
        allShutters2.removeAll()
        allShutters2.formUnion(con.getRequestAutomation())
        
        
        
        var temp =  Set<DeviceLight>()
        var temp1 =  Set<DeviceAutomation>()
        var temp2 =  Set<DeviceThermoregulation>()
        
        roomLights = Array<DeviceLight>()
        
        for room in rooms {
            temp = temp.union(room.lightInstalled)
            temp1 = temp1.union(room.shutterInstalled)
            temp2 = temp2.union(room.tempInstalled)
        }
        
        roomLights = Array(allLights1.subtracting(temp))
        roomShutters = Array(allShutters2.subtracting(temp1))
        roomTemp = Array(allTemp2.subtracting(temp2))
        
        
        
        
        
        //allTemp.removeAll()
        //allTemp.append(con.getRequestTemperature(id: "1")!)
        //allTemp.append(con.getRequestTemperature(id: "2")!)
        //allShutters.removeAll()
        //allShutters = con.getRequestAutomation()
        
        
        
        // Do any additional setup after loading the view.
    }
    @IBAction func donePressed(_ sender: UIBarButtonItem) {
        var i = 0
        for cell in self.myTableView.visibleCells {
            if cell.accessoryType == UITableViewCellAccessoryType.checkmark {
                if cell is LightTableViewCell {
                    room.lightInstalled.append(roomLights[i])
                }
                if cell is ShutterTableViewCell {
                    room.shutterInstalled.append(roomShutters[i-roomLights.count])
                }
                if cell is TermometerTableViewCell {
                    room.tempInstalled.append(roomTemp[i-roomLights.count-roomShutters.count])
                }
                
            }
            i = i+1
        }
        dismiss(animated: true, completion: nil)
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark{
             tableView.cellForRow(at: indexPath)?.accessoryType =  UITableViewCellAccessoryType.none
        }
        else{
             tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
