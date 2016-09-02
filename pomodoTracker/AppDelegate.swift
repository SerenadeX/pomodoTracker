//
//  AppDelegate.swift
//  pomodoTracker
//
//  Created by Steve Spigarelli on 8/27/16.
//  Copyright © 2016 Steve Spigarelli. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        
        UNUserNotificationCenter.current().delegate = window?.rootViewController as? TaskTableViewController
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
        
        // Register UNNotifications
        center.requestAuthorization(options: [.alert, .sound, .badge], completionHandler: { (granted, error) in // ...
            if granted {
                print("user notification center request granted")
            }
        })
        
        let actionNew = UNTextInputNotificationAction(identifier: Consts.newIdentifier, title: "New Activity", options: [])
        let actionContinue = UNNotificationAction(identifier: Consts.continueIdentifier, title: "Continue", options: [])
        let actionStop = UNNotificationAction(identifier: Consts.stopIdentifier, title: "Stop", options: [])
        let actionShortBreak = UNNotificationAction(identifier: Consts.shortBreakIdentifier, title: "Short Break", options: [])
        let actionLongBreak = UNNotificationAction(identifier: Consts.longBreakIdentifier, title: "Long Break", options: [])
        
        let completeCategory = UNNotificationCategory(identifier: Consts.completeCategory, actions: [actionNew, actionContinue, actionShortBreak, actionLongBreak, actionStop], intentIdentifiers: [], options: [.customDismissAction])
        let breakOverCategory = UNNotificationCategory(identifier: Consts.breakOverCategory, actions: [actionNew], intentIdentifiers: [], options: [.customDismissAction])
        
        center.setNotificationCategories([completeCategory, breakOverCategory])
        
        
        
        return true
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        
        let content = UNMutableNotificationContent()
        content.title = "Pomodoro Tracker"
        content.body = "What is your focus right now?"
        content.categoryIdentifier = Consts.completeCategory
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: Consts.requestIdentifier, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
        
        
        return true
    }
    
    /*
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        tableViewController = self.window!.rootViewController as! TaskTableViewController
        UNUserNotificationCenter.current().delegate = tableViewController
        
        return true
    }*/

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

