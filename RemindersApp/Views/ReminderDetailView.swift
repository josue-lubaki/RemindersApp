//
//  ReminderDetailView.swift
//  RemindersApp
//
//  Created by Josue Lubaki on 2024-03-18.
//

import SwiftUI

struct ReminderDetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Binding var reminder : Reminder
    @State var editConfig : ReminderEditConfig = ReminderEditConfig()
    
    private var isFormValid : Bool {
        !editConfig.title.isEmptyOrWhitespace
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section {
                        TextField("Title", text: $editConfig.title)
                        TextField("Title", text: $editConfig.notes ?? "")
                    }
                    
                    Section {
                        Toggle(isOn: $editConfig.hasDate){
                            Image(systemName: "calendar")
                                .foregroundColor(.red)
                        }
                        
                        if editConfig.hasDate {
                            DatePicker("Select Date", selection: $editConfig.reminderDate ?? Date(),
                                       displayedComponents: .date)
                        }
                        
                        Toggle(isOn: $editConfig.hasTime){
                            Image(systemName: "clock")
                                .foregroundColor(.blue)
                        }
                        
                        if editConfig.hasTime {
                            DatePicker("Select Hour", selection: $editConfig.reminderTime ?? Date(),
                                       displayedComponents: .hourAndMinute)
                        }
                        
                        Section {
                            NavigationLink {
                                SelectListView(selectList: $reminder.list)
                            } label : {
                                HStack {
                                    Text("List")
                                    Spacer()
                                    Text(reminder.list!.name)
                                }
                            }
                        }
                        
                    }.onChange(of: editConfig.hasDate){
                        if editConfig.hasDate {
                            editConfig.reminderDate = Date()
                        }
                    }.onChange(of: editConfig.hasTime){
                        if editConfig.hasTime {
                            editConfig.reminderTime = Date()
                        }
                    }
                }.listStyle(.insetGrouped)
            }
            .onAppear {
                editConfig = ReminderEditConfig(reminder: reminder)
            }
            .toolbar {
                ToolbarItem(placement: .principal){
                    Text("Details")
                }
                
                ToolbarItem(placement: .topBarTrailing){
                    Button("Done"){
                        do {
                            let updated = try ReminderService.updateReminder(reminder: reminder, editConfig: editConfig)
                            if updated {
                                // check if we should even schedule a notification
                                if reminder.reminderDate != nil || reminder.reminderTime != nil {
                                    let userData = UserData(title: reminder.title, body: reminder.notes, date: reminder.reminderDate, time: reminder.reminderTime)
                                    NotificationManager.scheduleNotification(userData: userData)
                                }
                            }
                        } catch {
                            print(error)
                        }
                        dismiss() // go away
                    }.disabled(!isFormValid)
                }
                
                ToolbarItem(placement: .topBarLeading){
                    Button("Cancel"){
                        dismiss()
                    }
                }
            }
        }
    }
}

struct ReminderDetailView_Previews : PreviewProvider {
    static var previews: some View {
        ReminderDetailView(reminder: .constant(PreviewData.reminder))
    }
}
