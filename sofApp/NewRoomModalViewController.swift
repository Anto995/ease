
//  Created by Antonio Scialdone on 04/03/2017.
//  Copyright © 2017 Antonio Scialdone. All rights reserved.
//

import UIKit

class NewRoomModalViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var id: Int?
    var roomType = ["Bathroom", "Bedroom", "Kitchen", "Living Room", "Double Room", "Other"]
    var imageSelection = [#imageLiteral(resourceName: "bathroom"), #imageLiteral(resourceName: "bedroom"), #imageLiteral(resourceName: "kitchen"), #imageLiteral(resourceName: "livingroom"), #imageLiteral(resourceName: "double room"), #imageLiteral(resourceName: "other")]
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    @IBOutlet weak var roomSelected: UILabel!
    
    
    @IBOutlet weak var roomDescr: UITextField!
    
    @IBOutlet weak var roomSelectedImage: UIImageView!
    
    @IBAction func donePressed(_ sender: UIBarButtonItem) {
        
        rooms.append(Room(name: roomDescr.text!, identifier: id!, floor: floorTextField.text!, color: colors[Int(arc4random_uniform(UInt32(colors.count)))] ))
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var floorTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.roomSelector.dataSource = self
        self.roomSelector.delegate = self
        pickerView(roomSelector, didSelectRow: 0, inComponent: 1)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func labelPressed(_ sender: UITapGestureRecognizer) {
        roomSelector.isHidden = false
    }
    
    @IBOutlet weak var roomSelector: UIPickerView!
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return roomType.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return roomType[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        roomSelectedImage.image = imageSelection[row]
        id = row + 1
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
