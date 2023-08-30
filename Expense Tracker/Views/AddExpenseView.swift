//
//  AddExpenseView.swift
//  Expense Tracker
//
//  Created by me on 28/08/2023.
//

import SwiftUI

struct AddExpenseView: View {
    
    @State private var name = ""
    @State private var amount = ""
    @State private var isExpenseAdded = false
    @State private var selectedCategory: String? = nil
    let catagories = ["Food", "Housing", "Transport", "Entertainment", "Utilities"]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20){
                TextField("Name of Expense", text: $name)
                    .padding()
                    .foregroundColor(.secondary)
                    .background(.white)
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                TextField("Amount", text: $amount)
                    .padding()
                    .foregroundColor(.secondary)
                    .background(.white)
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
                LazyVGrid(columns: [
                    GridItem(.flexible(),spacing: 16),
                    GridItem(.flexible(),spacing: 16),
                    GridItem(.flexible(),spacing: 16)
                    
                ], spacing: 16){
                    ForEach(catagories[0...2], id: \.self) {
                        category in
                        Button {
                            selectedCategory = category
                        } label: {
                            Text(category)
                        }
                    }
                }
            }
            .padding(.horizontal)
            .navigationTitle("Add Expense")
//            .preferredColorScheme(.dark)
        }
    }
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView()
    }
}
