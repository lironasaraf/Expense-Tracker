//
//  ExpenseView.swift
//  Expense Tracker
//
//  Created by me on 28/08/2023.
//

import SwiftUI

struct ExpenseView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    
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
                        .contextMenu{
                            Button{
                                deleteExpense(expense: expense)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }

                        
                   
                        
                    }
                }
            }
            .padding()
            .navigationTitle("Expenses")
        }
    }
    
    func deleteExpense(expense: Expense1) {
        withAnimation {
            managedObjContext.delete(expense)
            do {
                try managedObjContext.save()
                print("Data saved successfully")
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError)")
            }
        }
    }
}

struct ExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseView()
    }
}
