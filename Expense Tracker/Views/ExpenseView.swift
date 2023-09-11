//
//  ExpenseView.swift
//  Expense Tracker
//
//  Created by me on 28/08/2023.
//

import SwiftUI

struct ExpenseView: View {
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)])
    var expense:FetchedResults<Expense1>
    
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.vertical, showsIndicators: true) {
                    HStack{
                        Text("Welcome")
                            .font(.title)
                        Spacer()
                    }
                    ForEach(expense) { expense in
                        NavigationLink {
                            EditExpenseView(expense: expense)
                        } label: {
                            ExpenseDetail(amount: String(expense.amount), date: expense.date!, name: expense.name!, type: expense.type ?? "Transportation")
                        }

                        
                   
                        
                    }
                }
            }
            .padding()
            .navigationTitle("Expenses")
        }
    }
}

struct ExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseView()
    }
}
