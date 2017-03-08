//
//  ScenarioViewController.swift
//  Scenario2
//
//  Created by Roberto Palladino on 06/03/2017.
//  Copyright © 2017 Roberto Palladino. All rights reserved.
//

import UIKit

class ScenarioViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let datePickerView:UIDatePicker = UIDatePicker()
    var scena: Scenary = Scenary()
    var imageSelection = [#imageLiteral(resourceName: "bathroom"), #imageLiteral(resourceName: "bedroom"), #imageLiteral(resourceName: "kitchen"), #imageLiteral(resourceName: "livingroom"), #imageLiteral(resourceName: "double room"), #imageLiteral(resourceName: "other")]
    
    
    //var listaDevices = ["Luce1","Tappa1"] //supp che lo scenario posssiede già disp
    
    @IBOutlet weak var scenaryOutlet: UITextField!
    @IBOutlet weak var devicesTableView: UITableView!
    
    @IBOutlet weak var sceneSelector: UIPickerView!
    @IBOutlet weak var scenarioStartAt: UITextField!
    
    @IBOutlet weak var scenarioEndAt: UITextField!
 
    @IBOutlet weak var selectedImage: UIImageView!
    
    var listaCamere = ["cucina","salotto"]


    
   
    
    override func viewWillAppear(_ animated: Bool) {
        self.devicesTableView.reloadData()
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
        
    }
    
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      // se è una luce
        let cell = tableView.dequeueReusableCell(withIdentifier: "lightCell", for: indexPath) as! LightTableViewCell
        // Configure the cell...
        
        return cell
    }
    
    @IBAction func startTimeTapped(_ sender: UITextField)
        
    {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton  = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressedStart))
        toolbar.setItems([doneButton], animated: false)
        
        datePickerView.datePickerMode = UIDatePickerMode.time
        
        sender.inputView = datePickerView
        sender.inputAccessoryView = toolbar
    }
    
    @IBAction func donePressed(_ sender: UIBarButtonItem) {
        
    }
    
    
    
    //@IBAction func repeatTapped(_ sender: UITextField) {
    //}
    
    
    @IBAction func endTimeTapped(_ sender: UITextField) {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton  = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressedEnd))
        toolbar.setItems([doneButton], animated: false)
        
        datePickerView.datePickerMode = UIDatePickerMode.time
        
        sender.inputView = datePickerView
        sender.inputAccessoryView = toolbar
    }
    
    func donePressedStart(){
        
        let dateFormatter = DateFormatter()
        
        
        dateFormatter.timeStyle = .short
        scenarioStartAt.text = dateFormatter.string(from: datePickerView.date)
        self.view.endEditing(true)
        
        
    }
    
    
    func donePressedEnd(){
        let dateFormatter = DateFormatter()
        
        
        dateFormatter.timeStyle = .short
        scenarioEndAt.text = dateFormatter.string(from: datePickerView.date)
        self.view.endEditing(true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        devicesTableView.delegate = self
        devicesTableView.dataSource = self
        
        self.sceneSelector.dataSource = self
        self.sceneSelector.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
    
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let dstView = segue.destination as! DeviceSelectionViewController
        dstView.scenario = scena
        
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedImage.image = imageSelection[row]
        
        
    }
    
    
    
    

}
