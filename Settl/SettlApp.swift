//
//  SettlApp.swift
//  Settl
//
//  Created by Sumit Gera on 26/08/24.
//

import SwiftUI
import GoogleSignIn

@main
struct SettlApp: App {
    var body: some Scene {
        WindowGroup {
          OnboardingView()
            .onOpenURL { url in
              GIDSignIn.sharedInstance.handle(url)
            }
            .onAppear {
              GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                // TODO: Check if user exists, do something if error
              }
            }
        }
    }
}
