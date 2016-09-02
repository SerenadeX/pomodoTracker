//
//  TaskTableViewController.swift
//  pomodoTracker
//
//  Created by Steve Spigarelli on 8/30/16.
//  Copyright © 2016 Steve Spigarelli. All rights reserved.
//

import UIKit
import UserNotifications

class TaskTableViewController: UITableViewController {
    
    // MARK: Properties
    var tasks = ["One", "Two", "Three"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
    }

    override func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: (UNNotificationPresentationOptions) -> Void) {
        super.userNotificationCenter(center, willPresent: notification, withCompletionHandler: completionHandler)
        
        print("presenting")
    }
    
    override func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: () -> Void) {
        super.userNotificationCenter(center, didReceive: response, withCompletionHandler: completionHandler)
        
        print("receiving")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "TaskTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TaskTableViewCell
        
        let task = tasks[indexPath.row]

        cell.nameLabel.text = task

        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UITableViewController: UNUserNotificationCenterDelegate {
    public func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: () -> Void) {
        print("notification dismissed")
        print(response.actionIdentifier)
        if response.actionIdentifier == Consts.newIdentifier ||
            response.actionIdentifier == Consts.continueIdentifier {
            // add row to table based on response text
            // start a new request to notification center

            let content = UNMutableNotificationContent()
            content.title = "Pomodoro Over!"
            content.body = "Congratulations! What do you want to do next?"
            content.categoryIdentifier = Consts.completeCategory
            
            //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 25*60, repeats: true)
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: false)
            
            
            let request = UNNotificationRequest(identifier: Consts.requestIdentifier, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request) { (error) in //...
 //               UNUserNotificationCenter.current().delegate = self
                
                if (error != nil) {
                    // handle error
                }
            }

        } else if response.actionIdentifier == Consts.shortBreakIdentifier ||
            response.actionIdentifier == Consts.longBreakIdentifier {
            
            let content = UNMutableNotificationContent()
            content.title = "Break Over!"
            content.body = "Choose your next task"
            content.categoryIdentifier = Consts.breakOverCategory
            
            //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 25*60, repeats: true)
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: false)
            
            
            let request = UNNotificationRequest(identifier: Consts.requestIdentifier, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request) { (error) in //...
   //             UNUserNotificationCenter.current().delegate = self
                
                if (error != nil) {
                    // handle error
                }
            }

        } else {
            print("in else")
        }
    }
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: (UNNotificationPresentationOptions) -> Void) {
        print("app is active")
    }
}

















