//
//  MyList+CoreDataClass.swift
//  RemindersApp
//
//  Created by Josue Lubaki on 2024-03-17.
//

import Foundation
import CoreData

@objc(MyList)
public class MyList : NSManagedObject {
    
    var remindersArray : [Reminder] {
        reminders?.allObjects.compactMap { ($0 as! Reminder) } ?? []
    }
    
}
