//
//  RemindersAppApp.swift
//  RemindersApp
//
//  Created by Josue Lubaki on 2024-03-17.
//

import SwiftUI
import UserNotifications

@main
struct RemindersAppApp: App {
    
    // ask or request for authorization notification
    init() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]){ granted, error in
            
            if granted {
                // notification is granted
            }
            else {
                // display message to the user
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, CoreDataProvider.shared.persistentContainer.viewContext)
        }
    }
}
