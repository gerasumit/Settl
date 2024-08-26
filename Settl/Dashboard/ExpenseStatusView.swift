//
//  ExpenseStatusView.swift
//  Settl
//
//  Created by Sumit Gera on 26/08/24.
//

import SwiftUI

struct BalanceStatusView: View {
  let balance: BalanceOverview
  
  var body: some View {
    VStack {
      Text(balance.isOwed ? "You owe \(balance.participant2.name)" : "\(balance.participant2.name) owes you")
      Text(String(balance.amount))
        .foregroundColor(balance.isOwed ? Color.red : Color.green)
    }
  }
}

#Preview {
  BalanceStatusView(balance: BalanceOverview(amount: 100, isOwed: true, participant2: User(name: "Raju")))
}
