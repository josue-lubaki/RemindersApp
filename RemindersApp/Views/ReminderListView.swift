//
//  ReminderListView.swift
//  RemindersApp
//
//  Created by Josue Lubaki on 2024-03-17.
//

import SwiftUI

struct ReminderListView: View {
    
    let reminders : FetchedResults<Reminder>
    
    var body: some View {
        List(reminders) { reminder in
            Text(reminder.title ?? "")
        }
    }
}

//struct ReminderListView_Previews : PreviewProvider {
//    static var previews: some View {
//        ReminderListView()
//    }
//}
