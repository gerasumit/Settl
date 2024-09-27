//
//  SecondaryButton.swift
//  Settl
//
//  Created by Sumit Gera on 27/09/24.
//

import SwiftUI

struct SecondaryButton: View {
  let title: String
  let action: () -> Void
  
  init(title: String, action: @escaping () -> Void) {
    self.title = title
    self.action = action
  }
  
  var body: some View {
    Button(action: action) {
      Text(title)
    }
    .frame(maxWidth: .infinity, maxHeight: 64)
    .overlay(
        RoundedRectangle(cornerRadius: 32)
            .stroke(AppColors.brand.color, lineWidth: 1)
    )
    .foregroundColor(AppColors.brand.color)
    .cornerRadius(32)
    .padding(.leading, 16)
    .padding(.trailing, 16)
  }
}


#Preview {
  SecondaryButton(title: "Create an account", action: {})
}
