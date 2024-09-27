//
//  PrimaryButton.swift
//  Settl
//
//  Created by Sumit Gera on 13/09/24.
//

import SwiftUI

struct PrimaryButton: View {
  let title: String
  let action: () -> Void
  @Environment(\.colorScheme) var colorScheme
  
  init(title: String, action: @escaping () -> Void) {
    self.title = title
    self.action = action
  }
  
  var body: some View {
    Button(action: action) {
      Text(title)
    }
    .frame(maxWidth: .infinity, minHeight: 64)
    .background(AppColors.brand.color)
    .foregroundColor(.white)
    .cornerRadius(32)
    .shadow(color: colorScheme == .light ? AppColors.grey002.color : AppColors.grey002.color.opacity(0), radius: 10, x: 0, y: 4)
    .padding(.leading, 16)
    .padding(.trailing, 16)
  }
}

#Preview {
  PrimaryButton(title: "Login with Phone", action: {})
}
