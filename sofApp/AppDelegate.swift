//
//  AppDelegate.swift
//  sofApp
//
//  Created by Antonio Scialdone on 06/03/2017.
//  Copyright © 2017 Antonio Scialdone. All rights reserved.
//

import UIKit
let colors: [UIColor] = [UIColor.blue, UIColor.green, UIColor.lightGray]
var favoriteLights =  [DeviceLight]()
var favoriteShutters = [DeviceAutomation]()
var favoriteTemp = [DeviceThermoregulation]()
var allLights = [DeviceLight]()
var allLights1 = Set<DeviceLight>()
var allShutters2 = Set<DeviceAutomation>()
var allTemp2 = Set<DeviceThermoregulation>()
var allShutters = [DeviceAutomation]()
var allTemp = [DeviceThermoregulation]()
var scenes = [Scenary]()
var rooms = [Room]()

var con = OWNConnection(ip: "127.0.0.1", port: 20000)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

