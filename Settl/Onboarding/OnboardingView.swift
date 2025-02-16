//
//  OnboardingView.swift
//  Settl
//
//  Created by Sumit Gera on 12/09/24.
//

import SwiftUI

enum Flow: Decodable, Hashable {
  case login
  case register
}

struct OnboardingView: View {
  @State private var path = NavigationPath()
  
  var body: some View {
    NavigationStack(path: $path) {
      VStack(spacing: 0) {
        onboardingHeader()
        Spacer()
        onboardingFooter()
      }.padding(.top, 80)
    }
  }
}

fileprivate extension OnboardingView {
  func onboardingHeader() -> some View {
    return VStack(spacing: 16) {
      Text("Manage your daily expenses everyday")
        .font(.title)
        .bold()
      
      Text("Manage your daily expenses")
        .font(.callout)
    }
  }
  
  func onboardingFooter() -> some View {
    return VStack {
      Button("Login with Phone") {
          path.append(Flow.login)
        }
          .primaryButton()
          .padding(.bottom, 16)
      
      Button("Create account") {
        path.append(Flow.register)
      }
        .secondaryButton()
    }
    .navigationDestination(for: Flow.self) { value in
      // TODO: Handle login & register action
    }
  }
}


#Preview {
  OnboardingView()
}
