//
//  MyListView.swift
//  RemindersApp
//
//  Created by Josue Lubaki on 2024-03-17.
//

import SwiftUI

struct MyListsView: View {
    
    let myLists: FetchedResults<MyList>
    
    var body: some View {
        NavigationStack {
            
            if myLists.isEmpty {
                Spacer()
                Text("No reminders found")
            } else {
                ForEach(myLists) { list in
                    MyListCellView(myList: list)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                        .font(.title3)
                    Divider()
                }
            }
        }
    }
}

//struct MyListsView_Previews : PreviewProvider {
//    static var previews: some View {
//        MyListsView()
//    }
//}
