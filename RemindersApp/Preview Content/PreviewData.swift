//
//  PreviewData.swift
//  RemindersApp
//
//  Created by Josue Lubaki on 2024-03-17.
//

import Foundation
import CoreData

class PreviewData {
    
    static var myList : MyList {
        let viewContext = CoreDataProvider.shared.persistentContainer.viewContext
        let request = MyList.fetchRequest()
        return (try? viewContext.fetch(request).first) ?? MyList()
    }
    
}
