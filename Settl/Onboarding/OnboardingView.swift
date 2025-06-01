//
//  OnboardingView.swift
//  Settl
//
//  Created by Sumit Gera on 12/09/24.
//

import GoogleSignIn
import GoogleSignInSwift
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
      Button("Sign In with Google", action: handleGoogleSignIn)
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
  
  func handleGoogleSignIn() {
    guard let vc =  UIApplication.shared.connectedScenes.compactMap({ $0 as? UIWindowScene }).first?.keyWindow?.rootViewController else { return }
    GIDSignIn.sharedInstance.signIn(withPresenting: vc) { result, error in
      guard let result = result else { return }
      print("Google Sign In Result: \(result)")
    }
  }
}


#Preview {
  OnboardingView()
}
