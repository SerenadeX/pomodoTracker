//
//  NotificationHandler.swift
//  pomodoTracker
//
//  Created by Rhett Rogers on 9/2/16.
//  Copyright © 2016 Steve Spigarelli. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications


class NotificationHandler: NSObject, UNUserNotificationCenterDelegate {
    
    static var shared = NotificationHandler()
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        
        if let viewController = UIApplication.shared.delegate?.window??.rootViewController as? TaskTableViewController {
            viewController.userNotificationCenter(center, willPresent: notification, withCompletionHandler: completionHandler)
        }
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        
        if let viewController = UIApplication.shared.delegate?.window??.rootViewController as? TaskTableViewController {
            viewController.userNotificationCenter(center, didReceive: response, withCompletionHandler: completionHandler)
        }
    }
    
 
}
