//
//  ExpenseStatusView.swift
//  Settl
//
//  Created by Sumit Gera on 26/08/24.
//

import SwiftUI

struct ExpenseStatusView: View {
    let expense: ExpenseOverview
    
    var body: some View {
        Text(expense.expenseSummaryText)
    }
}

#Preview {
    ExpenseStatusView(expense: ExpenseOverview(expenseSummaryText: "You owe me 100 dollars"))
}
