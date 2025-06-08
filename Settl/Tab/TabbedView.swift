//
//  TabbedView.swift
//  Settl
//
//  Created by Sumit Gera on 31/08/24.
//

import SwiftUI

enum TabbedItem: Int, CaseIterable {
  case dashboard = 0
  case groups
  case addExpense
  case activity
  case account
}

struct TabbedView: View {
  @State var selectedTab: Int = 0
  
  var body: some View {
    ZStack(alignment: .bottom) {
      TabView {
        OnboardingView(viewModel: OnboardingViewModel())
        GroupsView()
        AddExpenseView()
        ActivityView()
        AccountView()
      }
      
      ZStack {
        HStack {
          ForEach((TabbedItem.allCases), id: \.self) { item in
            if (item == TabbedItem(rawValue: selectedTab)) {
              Image("delete")
                .resizable()
                .frame(width: 32, height: 32)
            } else {
              Image("person")
                .resizable()
                .frame(width: 32, height: 32)
                
            }
          }.padding(6)
        }.padding()
      }
      .frame(height: 64)
      .background(Color.init(hue: 219/360, saturation: 80/100, brightness: 80/100))
      .cornerRadius(24)
    }
  }
}

#Preview {
  TabbedView()
}
