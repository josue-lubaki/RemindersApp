//
//  MyListDetailView.swift
//  RemindersApp
//
//  Created by Josue Lubaki on 2024-03-17.
//

import SwiftUI

struct MyListDetailView: View {
    
    let myList : MyList
    @State private var openAddReminder : Bool = false
    @State private var title : String = ""
    
    @FetchRequest(sortDescriptors: [])
    private var remindersResults : FetchedResults<Reminder>
    
    private var isFormValid : Bool {
        !title.isEmpty
    }
    
    init(myList : MyList){
        self.myList = myList
        _remindersResults =
            FetchRequest(fetchRequest: ReminderService.getRemindersByList(myList: myList))
    }
    
    var body: some View {
        VStack {
            
            // Display List of Reminders
            ReminderListView(reminders: remindersResults)
            
            HStack {
                Image(systemName: "plus.circle.fill")
                Button("New Reminder"){
                    openAddReminder = true
                }
            }
            .foregroundColor(.blue)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .padding()
        }
        .alert("New Reminders", isPresented: $openAddReminder){
            TextField("", text: $title)
            Button("Cancel", role: .cancel){
                
            }
            Button("Done"){
                if isFormValid {
                    // Save Reminder to my List
                    do {
                        try ReminderService.saveReminderToMyList(myList: myList, reminderTitle: title)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }.disabled(!isFormValid)
            
        }
    }
}

struct MyListDetailView_Previews : PreviewProvider {
    static var previews: some View {
        MyListDetailView(myList: PreviewData.myList)
    }
}
