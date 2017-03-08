//
//  NotificationManager.swift
//  UC_CoreData_Test
//
//  Created by John Barbone on 2/28/17.
//  Copyright © 2017 CollinsInnovation. All rights reserved.
//

import Foundation
import UserNotifications

let center = UNUserNotificationCenter.current()

class NotificationsManager {
    
    let center = UNUserNotificationCenter.current()
    
    let snoozeAction = UNNotificationAction(identifier: "Snooze",
                                            title: "Snooze", options: [])
    let deleteAction = UNNotificationAction(identifier: "DeleteAction",
                                            title: "Delete", options: [.destructive])
    
    

    
    init() {
        
        let category = UNNotificationCategory(identifier: "Reminder",
                                              actions: [snoozeAction,deleteAction],
                                              intentIdentifiers: [], options: [])
        
        center.requestAuthorization(options: UNAuthorizationOptions.alert) {
            (granted, error) in
            if !granted {
                print("Something went wrong")
            }
        }
        center.setNotificationCategories([category])
    }
    
    
    
    func newNotification(med: String, mph: Int32, appearance: String) {
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = "It's time to take \(med)!"
        content.body = "It's appearance is: \(appearance)"
        content.categoryIdentifier = "alarm"
        content.userInfo = ["customData": "fizzbuzz"]
        content.sound = UNNotificationSound.default()
        content.categoryIdentifier = "Reminder"
        
        var dateComponents = DateComponents()
        dateComponents.hour = 0
        dateComponents.minute = 0
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: Double(mph)*Double(60), repeats: true)
        
        let request = UNNotificationRequest(identifier: med, content: content, trigger: trigger)
        center.add(request)
    }
    
    
}
