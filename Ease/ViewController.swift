//
//  ViewController.swift
//  Ease
//
//  Created by Antonio Scialdone on 27/02/2017.
//  Copyright © 2017 Antonio Scialdone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

     func firstTime() {
        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
        if launchedBefore  {
            
            print("Not first launch.")
            performSegue(withIdentifier: "6", sender: nil)
        } else {
            
            print("First launch, setting UserDefault.")
            UserDefaults.standard.set(true, forKey: "launchedBefore")
            performSegue(withIdentifier: "0", sender: nil)
        }
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        firstTime()
    }

    
    
    
}

