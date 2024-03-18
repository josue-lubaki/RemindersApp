//
//  SelectListView.swift
//  RemindersApp
//
//  Created by Josue Lubaki on 2024-03-18.
//

import SwiftUI

struct SelectListView: View {
    
    @FetchRequest(sortDescriptors: [])
    private var myListsFetchResults : FetchedResults<MyList>
    
    @Binding var selectList : MyList?
    
    var body: some View {
        List(myListsFetchResults){ myList in
            HStack {
                HStack {
                    Image(systemName: "line.3.horizontal.circle.fill")
                        .foregroundColor(Color(myList.color))
                    Text(myList.name)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .contentShape(Rectangle())
                .onTapGesture {
                    self.selectList = myList
                }
                
                Spacer()
                
                if selectList == myList {
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}

struct SelectListView_Previews : PreviewProvider {
    static var previews: some View {
        SelectListView(selectList: .constant(PreviewData.myList))
            .environment(\.managedObjectContext, CoreDataProvider.shared.persistentContainer.viewContext)
    }
}
