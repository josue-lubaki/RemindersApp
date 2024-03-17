//
//  CoreDataProvider.swift
//  RemindersApp
//
//  Created by Josue Lubaki on 2024-03-17.
//

import Foundation
import CoreData

class CoreDataProvider {
    
    static let shared = CoreDataProvider()
    
    let persistentContainer : NSPersistentContainer
    
    private init() {
        // reister custom tradformer
        ValueTransformer.setValueTransformer(UIColorTransformer(), forName: NSValueTransformerName("UIColorTransformer"))
        
        persistentContainer = NSPersistentContainer(name: "RemindersModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error {
                fatalError("Error initializing RemindersModel \(error)")
            }
        }
    }
    
    
}
