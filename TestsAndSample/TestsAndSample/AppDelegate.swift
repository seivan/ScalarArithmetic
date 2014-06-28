//
//  AppDelegate.swift
//  TestsAndSample
//
//  Created by Seivan Heidari on 28/06/14.
//  Copyright (c) 2014 Seivan Heidari. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
  var window: UIWindow?

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
    self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
    // Override point for customization after application launch.
    self.window!.backgroundColor = UIColor.whiteColor()
    self.window!.makeKeyAndVisible()
    
    
    return true
  }



}

