//
//  ContentView.swift
//  RemindersApp
//
//  Created by Josue Lubaki on 2024-03-17.
//

import SwiftUI

struct HomeView: View {
    
    @FetchRequest(sortDescriptors: [])
    private var myListResults : FetchedResults<MyList>
    
    @FetchRequest(sortDescriptors: [])
    private var searchResults : FetchedResults<Reminder>
    
    @State private var search : String = ""
    @State private var searching : Bool = false
    @State private var isPresented : Bool = false
    
    var body: some View {
        
        NavigationStack {
            VStack {
                ScrollView {
                    MyListsView(myLists: myListResults)
                    
                    // Spacer()
                    
                    Button {
                        isPresented = true
                    } label : {
                        Text("Add List")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .font(.headline)
                    }.padding()
                }
            }
            .onChange(of: search) {
                searching = !search.isEmptyOrWhitespace ? true : false
                searchResults.nsPredicate = ReminderService.getRemindersBySearchTerm(search).predicate
            }.overlay(alignment: .center, content: {
                ReminderListView(reminders: searchResults)
                    .opacity(searching ? 1.0 : 0.0)
            })
            .sheet(isPresented: $isPresented){
                NavigationView {
                    AddNewListView { name, color in
                        // save the list to the database
                        do {
                            try ReminderService.saveMyList(name, color)
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            .padding()
        }.searchable(text: $search)
    }
}

struct Home_Previews : PreviewProvider {
    static var previews: some View {
        HomeView()
            .environment(\.managedObjectContext, CoreDataProvider.shared.persistentContainer.viewContext)
    }
}
