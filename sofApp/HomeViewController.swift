//
//  HomeViewController.swift
//  sofApp
//
//  Created by Antonio Scialdone on 06/03/2017.
//  Copyright © 2017 Antonio Scialdone. All rights reserved.
//

import UIKit
import QuartzCore


class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var actualScene: Scenary?
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet var myImageView: UIImageView!
    @IBOutlet var myTableView: UITableView!
    @IBOutlet weak var lightButton: UIButton!
    
    @IBOutlet weak var temperatureButton: UIButton!
    @IBOutlet weak var shutterButton: UIButton!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var myStepper: UIStepper!
    
    
    @IBAction func settemperatureAction(_ sender: UIStepper) {
        temperature.text = "\(myStepper.value) °C"
    }
    
    @IBAction func turnOffAllLights(_ sender: UIButton) {
        
        con.sendCommandLights(status: DeviceLight.STATUS.OFF)
        for item in allLights1 {
            item.status = DeviceLight.STATUS.OFF
        }
        myTableView.reloadData()
    }
    
    @IBAction func closeAllShutter(_ sender: UIButton) {
    }
    
    @IBAction func setGeneralTemperature(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowCount = 0
        if section == 0 {
            if (favoriteLights.count == 0) {
                return 1
            } else {
                rowCount = favoriteLights.count
            }
            
        }
        if section == 1 {
            if (favoriteShutters.count == 0) {
                return 1
            } else {
                rowCount = favoriteShutters.count
            }
        }
        if section == 2 {
            if (favoriteTemp.count == 0) {
                return 1
            } else {
                rowCount = favoriteTemp.count
            }
        }
        return rowCount
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (favoriteLights.count + favoriteTemp.count + favoriteShutters.count) == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath) as! DefaultTableViewCell
            return cell
        }
        
        if indexPath.section == 0 {
            
            let lightDev = favoriteLights[indexPath.row]
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
           
            let shutDev = favoriteShutters[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "shutterCell", for: indexPath) as! ShutterTableViewCell
            cell.myImageView.image = #imageLiteral(resourceName: "shutter")
            cell.shutter.text = "Shutter: \(shutDev.id)"
            cell.room.text = shutDev.room?.name
            cell.id = shutDev.id
            return cell
        } else {
            
            let tempDev = favoriteTemp[indexPath.row]
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.myTableView.reloadData()
        if (actualScene == nil) {
            myImageView.layer.cornerRadius = 25
            myImageView.backgroundColor = UIColor.gray
            myLabel.text = "Select a scene"
        }
        
        for item in rooms {
            if item.lightInstalled.count != 0 {
                lightButton.isEnabled = true
                break
            }
            
        }
        for item in rooms {
            if item.shutterInstalled.count != 0 {
                shutterButton.isEnabled = true
                break
            }
            
        }
        for item in rooms {
            if item.tempInstalled.count != 0 {
                temperatureButton.isEnabled = true
                myStepper.isEnabled = true
                temperature.isHidden = false
                break
            }
            
        }
        
    }
    
    
}
