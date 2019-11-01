//
//  AppDelegate.swift
//  sample
//
//  Created by 熊谷峻 on 2019/09/19.
//  Copyright © 2019 Shun Kuma. All rights reserved.
//

import UIKit
import TGRFramework

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, TGRClientDelegate {

  var window: UIWindow?
  var tgrClient: TGRClient?
  let appId: String = "256"
  let developerId: String = "89"
  let serviceId: String = "1082454069"
  let enableADID: Bool = true
  let enableNotify: Bool = true

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    let option = TGRInitOption(appId: appId, devId: developerId, serviceId: serviceId, enableADID: enableADID, enableNotify: enableNotify)
    tgrClient = TGRClient(option: option, delegate: self)
    tgrClient?.startMonitoring()
    return true
  }
  
  func receiveNotificationParam(_ action: [AnyHashable : Any]!, beacon: TGRBeacon!) {
  }
  
  func didEnter(withParams params: [AnyHashable : Any]!, rssi: NSNumber!) {
    let viewController: ViewController = window?.rootViewController as! ViewController
    viewController.reloadTable(info: params)
  }

  func didExit(withParams params: [AnyHashable : Any]!, rssi: NSNumber!) {
    
  }
  
  func didFailWith(_ errorType: TGRErrorType, error: Error!) {
    
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

