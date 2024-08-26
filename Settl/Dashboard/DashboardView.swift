//
//  DashboardView.swift
//  Settl
//
//  Created by Sumit Gera on 26/08/24.
//

import SwiftUI

struct DashboardView: View {
    let expenses: [ExpenseOverview] = [
        ExpenseOverview(expenseSummaryText: "You owe 100 dollars."),
        ExpenseOverview(expenseSummaryText: "You owe 25 dollars."),
        ExpenseOverview(expenseSummaryText: "Raju owes you 20 dollars."),
    ]
    
    var body: some View {
        NavigationView {
            List(expenses) { expense in
                    ExpenseStatusView(expense: expense)
            }.navigationTitle("Dashboard")
        }
    }
}

#Preview {
    DashboardView()
}
