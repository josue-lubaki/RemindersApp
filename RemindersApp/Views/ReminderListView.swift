//
//  ReminderListView.swift
//  RemindersApp
//
//  Created by Josue Lubaki on 2024-03-17.
//

import SwiftUI

struct ReminderListView: View {
    
    let reminders : FetchedResults<Reminder>
    
    private func reminderCheckedChanged(reminder : Reminder){
        var editConfig = ReminderEditConfig(reminder: reminder)
        editConfig.isCompleted = !reminder.isCompleted
        
        do {
            let _ = try ReminderService.updateReminder(reminder: reminder, editConfig: editConfig)
        } catch {
            print(error)
        }
    }
    
    var body: some View {
        List(reminders) { reminder in
            ReminderCellView(reminder: reminder) { event in
                switch event {
                case .onSelect(let reminder) :
                    print("ON SELECTED")
                case .onCheckedChange(let reminder) :
                    reminderCheckedChanged(reminder: reminder)
                case .onInfo :
                    print("ON INFO")
                }
            }
        }
    }
}

//struct ReminderListView_Previews : PreviewProvider {
//    static var previews: some View {
//        ReminderListView()
//    }
//}
