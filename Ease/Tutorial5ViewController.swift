//
//  Tutorial5ViewController.swift
//  Ease
//
//  Created by Antonio Scialdone on 28/02/2017.
//  Copyright © 2017 Antonio Scialdone. All rights reserved.
//

import UIKit

class Tutorial5ViewController: UIViewController {

    var image: UIImage!
    var name: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let room = PersistenceManager.createRoom(name: name, image: image)
        PersistenceManager.insertDevice(name: "Luce", id: 0, into: room)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
