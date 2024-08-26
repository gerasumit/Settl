//
//  ExpenseOverview.swift
//  Settl
//
//  Created by Sumit Gera on 26/08/24.
//

import Foundation

struct BalanceOverview: Identifiable {
  let id = UUID()
  
  let amount: Double
  let isOwed: Bool
  let participant2: User
}

struct User: Identifiable {
  let id = UUID()
  
  let name: String
}
