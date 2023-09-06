//
//  ContentView.swift
//  Expense Tracker
//
//  Created by me on 28/08/2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            ExpenseView()
                .tabItem {
                    Image(systemName: "dollarsign")
                    Text("Expense")
                }
            AddExpenseView()
                .tabItem {
                    Image(systemName: "plus")
                    Text("Add Expense")
                }
        }

        .padding()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
