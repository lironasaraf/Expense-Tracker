//
//  Expense_TrackerApp.swift
//  Expense Tracker
//
//  Created by me on 28/08/2023.
//

import SwiftUI


struct Expense_TrackerApp: App {
    @StateObject private var dataController = DataController()
    
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
