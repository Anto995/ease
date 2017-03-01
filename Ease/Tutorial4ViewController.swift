//
//  Tutorial4ViewController.swift
//  Ease
//
//  Created by Antonio Scialdone on 28/02/2017.
//  Copyright © 2017 Antonio Scialdone. All rights reserved.
//

import UIKit

class Tutorial4ViewController: UIViewController {

    @IBOutlet weak var topLabel: UILabel!
    
    var image: UIImage!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewDidAppear(_ animated: Bool) {
        print("\(topLabel.center.x) \(topLabel.center.y)")
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let dstView = segue.destination as! Tutorial5ViewController
        dstView.image = image
        dstView.name = nameTextField.text
        
    }
    

}
