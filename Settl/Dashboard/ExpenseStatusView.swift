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
    HStack {
      Text(balance.participant2.name)
        .font(.title2)
      VStack {
        Text(String(balance.isOwed ? "you owe" : "owes you"))
          .foregroundColor(balance.isOwed ? Color.red : Color.green)
          .font(.callout)
          .frame(maxWidth: .infinity, alignment: .trailing)
        Text("₹ \(balance.amount)")
          .foregroundColor(balance.isOwed ? Color.red : Color.green)
          .frame(maxWidth: .infinity, alignment: .trailing)
      }
    }
  }
}

#Preview {
  BalanceStatusView(balance: BalanceOverview(amount: 100, isOwed: true, participant2: User(name: "Raju")))
}
