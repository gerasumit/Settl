//
//  DashboardView.swift
//  Settl
//
//  Created by Sumit Gera on 26/08/24.
//

import SwiftUI

struct DashboardView: View {
  let balances: [BalanceOverview] = [
    BalanceOverview(amount: 100, isOwed: true, participant2: User(name: "Raju")),
    BalanceOverview(amount: 80, isOwed: false, participant2: User(name: "Anjali"))
  ]
  
  var body: some View {
    NavigationView {
      ZStack {
        Color.white.edgesIgnoringSafeArea(.all)
        
        List(balances) { balance in
          BalanceStatusView(balance: balance)
        }.listStyle(.plain)
      }.navigationTitle("Dashboard")
    }
  }
}

#Preview {
  DashboardView()
}
