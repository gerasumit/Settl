//
//  OnboardingViewModel.swift
//  Settl
//
//  Created by Sumit Gera on 07/06/25.
//

import Combine
import Foundation

class OnboardingViewModel: ObservableObject {
  private let loginClient: LoginClient
  private var cancellables: Set<AnyCancellable> = []
  
  init() {
    self.loginClient = LoginClient()
  }
  
  func login(email: String, idToken: String, expirationDate: Date) {
    loginClient.loginWithGoogle(params: GoogleLoginParams(email: email, idToken: idToken, expirationDate: expirationDate)).sink { completion in
      print(completion)
    } receiveValue: { response in
      print(response)
    }.store(in: &cancellables)
  }
}
