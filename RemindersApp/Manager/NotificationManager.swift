//
//  NotificationManager.swift
//  RemindersApp
//
//  Created by Josue Lubaki on 2024-03-20.
//

import Foundation
import UserNotifications

struct UserData {
    let title : String?
    let body : String?
    let date : Date?
    let time : Date?
}

class NotificationManager {
    
    static func scheduleNotification(userData : UserData){
        
        let content = UNMutableNotificationContent()
        content.title = userData.title ?? ""
        content.body = userData.body ?? "" // body are "notes" in Reminder
        
        // date
        var dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: userData.date ?? Date())
        
        if let reminderTime = userData.time {
            let reminderTimeDateComponent = reminderTime.dateComponents
            dateComponents.hour = reminderTimeDateComponent.hour
            dateComponents.minute = reminderTimeDateComponent.minute
        }
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let request = UNNotificationRequest(identifier: "Reminder Notification", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        
    }
    
}
