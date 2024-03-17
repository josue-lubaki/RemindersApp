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
                        // save the list
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
    }
}
