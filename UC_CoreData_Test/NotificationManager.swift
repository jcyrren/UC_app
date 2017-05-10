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
    
    
    
    func newNotification(med: String, mph: Int32, appearance: String, fire: DateComponents) {
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
        //let trigger = UNTimeIntervalNotificationTrigger(timeInterval: Double(mph)*Double(60), repeats: true)
        let trigger = UNCalendarNotificationTrigger(dateMatching: fire, repeats: true)
        
        let request = UNNotificationRequest(identifier: med, content: content, trigger: trigger)
        center.add(request)
    }
    
    func timedNotification(med: String, appearance: String, fire: NSDate) {
        let date = Date()
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        
        var dateComp:NSDateComponents = NSDateComponents()
        dateComp.year = year;
        dateComp.month = month;
        dateComp.day = day;
        dateComp.hour = 12;
        dateComp.minute = 55;
        dateComp.timeZone = NSTimeZone.system
        
        var calender:NSCalendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        //var date:NSDate = calender.date(from: dateComp as DateComponents)! as NSDate
        /*
        var notification:UILocalNotification = UILocalNotification()
        notification.category = "Daily Quote"
        notification.alertBody = quoteBook.randomQuote()
        notification.fireDate = date
        notification.repeatInterval =
            
            UIApplication.sharedApplication().scheduleLocalNotification(notification)
    */
    }
    
    
}
