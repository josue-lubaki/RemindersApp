//
//  ContentView.swift
//  RemindersApp
//
//  Created by Josue Lubaki on 2024-03-17.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isPresented : Bool = false
    
    var body: some View {
        
        NavigationStack {
            VStack {
                Text("Hello World")
                
                Spacer()
                
                Button {
                    isPresented = true
                } label : {
                    Text("Add List")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .font(.headline)
                }.padding()
            }
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
        }
        .padding()
    }
}

struct Home_Previews : PreviewProvider {
    static var previews: some View {
        HomeView()
            .environment(\.managedObjectContext, CoreDataProvider.shared.persistentContainer.viewContext)
    }
}
