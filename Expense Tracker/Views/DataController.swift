//
//  DataController.swift
//  Expense Tracker
//
//  Created by me on 03/09/2023.
//

import Foundation
import CoreData

class DataController: ObservableObject{
    let container = NSPersistentContainer(name: "ExpenseTracker")
    
    init(){
        container.loadPersistentStores { description , error in
            if let error = error {
                print("Failed to load data in data controller \(error.localizedDescription)")
            }
        }
    }
}
