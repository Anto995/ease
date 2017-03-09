//
//  ScenaryDetailsViewController.swift
//  sofApp
//
//  Created by Antonio Scialdone on 07/03/2017.
//  Copyright © 2017 Antonio Scialdone. All rights reserved.
//

import UIKit

class ScenaryDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var scenario: Scenary!
    @IBOutlet weak var scenaryImage: UIView!
    @IBOutlet weak var scenaryName: UITextField!
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var untilLabel: UILabel!
    @IBOutlet weak var devicesTableView: UITableView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        devicesTableView.delegate = self
        devicesTableView.dataSource = self
        print(scenario)

        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
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
