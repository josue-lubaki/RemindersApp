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
            ReminderCellView(reminder: reminder) { event in
                switch event {
                case .onSelect(let reminder) :
                    print("ON SELECTED")
                case .onCheckedChange(let reminder) :
                    print("ON CHECKED CHANGE")
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
