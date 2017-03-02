//
//  RoomDetailsViewController.swift
//  Ease
//
//  Created by Antonio Scialdone on 28/02/2017.
//  Copyright © 2017 Antonio Scialdone. All rights reserved.
//

import UIKit
import Socket

class RoomDetailsViewController: UIViewController {
    
    private func sendMesssage(message: String) {
        print("I want a socket")
        var socket: Socket
        
        _ = ""
        var data: Data = Data()
        do {
            socket = try Socket.create()
            try socket.connect(to: "10.24.48.12", port: 20000)
            try socket.write(from: message)
            let result = try socket.read(into: &data)
            let response = String(data: data, encoding: String.Encoding.utf8)
            print(response ?? "No Response Data")
        } catch {
            print("ruh-roh")
        }
    }
    @IBAction func prova(_ sender: UIButton) {
        sendMesssage(message: "*1*1*1##")
    }

    @IBAction func spegni(_ sender: UIButton) {
        sendMesssage(message: "*1*0*1##")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
