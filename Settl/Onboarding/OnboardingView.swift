//
//  OnboardingView.swift
//  Settl
//
//  Created by Sumit Gera on 12/09/24.
//

import SwiftUI

struct OnboardingView: View {
  @State private var isDashboardVisible = false
  var body: some View {
    VStack(spacing: 0) {
      Text("Manage your daily expenses everyday")
        .font(.title)
        .bold()
      
      Spacer().frame(height: 16)
      
      Text("Manage your daily expenses")
        .font(.callout)
      
      Spacer()
      
      VStack {
        PrimaryButton(title: "Login with Phone", action: {
          isDashboardVisible = true
        }).padding(.bottom, 16)
        
        SecondaryButton(title: "Create account", action: {})
      }
      
      NavigationLink(destination: DashboardView(), isActive: $isDashboardVisible) {
        EmptyView()
      }
      
    }.padding(EdgeInsets(top: 80, leading: 0, bottom: 0, trailing: 0))
  }
}

#Preview {
  OnboardingView()
}
