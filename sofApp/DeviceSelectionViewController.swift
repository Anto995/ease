//
//  DeviceSelectionViewController.swift
//  sofApp
//
//  Created by Antonio Scialdone on 07/03/2017.
//  Copyright © 2017 Antonio Scialdone. All rights reserved.
//

import UIKit

class DeviceSelectionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var scenario: Scenary!
    var allLightsInstalled =  [DeviceLight]()
    var allShuttersInstalled =  [DeviceAutomation]()
    var allTempInstalled =  [DeviceThermoregulation]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        
        for item in rooms {
            allLightsInstalled.append(contentsOf: item.lightInstalled)
            allShuttersInstalled.append(contentsOf: item.shutterInstalled)
            allTempInstalled.append(contentsOf: item.tempInstalled)
        }
        
        
        // Do any additional setup after loading the view.
    }

    @IBAction func donePressed(_ sender: Any) {
        var i = 0
        for cell in self.tableView.visibleCells {
            if cell.accessoryType == UITableViewCellAccessoryType.checkmark {
                if cell is LightTableViewCell {
                    scenario.lightInstalled.append(allLightsInstalled[i])
                    
                }
                if cell is ShutterTableViewCell {
                    scenario.shutterInstalled.append(allShuttersInstalled[i-allLightsInstalled.count])
                    
                }
                if cell is TermometerTableViewCell {
                    scenario.tempInstalled.append(allTempInstalled[i-allLightsInstalled.count-allShuttersInstalled.count])
                    
                }
                
            }
            i = i+1
        }
        dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var rowCount = 0
        if section == 0 {
            for room in rooms {
                rowCount = rowCount + room.lightInstalled.count
            }
        }
        if section == 1 {
            for room in rooms {
                rowCount = rowCount + room.shutterInstalled.count
            }
        }
        if section == 2 {
            for room in rooms {
                rowCount = rowCount + room.tempInstalled.count
            }
        }
        return rowCount
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let lightDev = allLightsInstalled[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "lightCell", for: indexPath) as! LightTableViewCell
            cell.myImageView.image = #imageLiteral(resourceName: "light")
            cell.lightPoint.text = "Light: \(lightDev.environment)\(lightDev.id)"
            cell.lightDev = lightDev
            cell.id = lightDev.id
            cell.enviroment = lightDev.environment
            cell.room.text = lightDev.room?.name
            if (lightDev.status == DeviceLight.STATUS.ON) {
                cell.mySwitch.isOn = true
            } else {
                cell.mySwitch.isOn = false
            }
            return cell
        } else if indexPath.section == 1 {
            let shutDev = allShuttersInstalled[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "shutterCell", for: indexPath) as! ShutterTableViewCell
            cell.myImageView.image = #imageLiteral(resourceName: "shutter")
            cell.shutter.text = "Shutter: \(shutDev.id)"
            cell.room.text = shutDev.room?.name
            cell.id = shutDev.id
            return cell
        } else {
            
            let tempDev = allTempInstalled[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "termometerCell", for: indexPath) as! TermometerTableViewCell
            cell.myImageView.image = #imageLiteral(resourceName: "temp")
            cell.termometer.text = "Termo: \(tempDev.id)"
            
            
            cell.id = tempDev.id
            cell.myStepper.value = (Double(tempDev.actualTemperature))!/10
            cell.temperature.text = "\(cell.myStepper.value)"
            cell.room.text = tempDev.room?.name
            return cell
            
        }
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
            
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tableView.reloadData()
    }

}
