//
//  ButtonModifier.swift
//  Settl
//
//  Created by Sumit Gera on 16/02/25.
//

import SwiftUI

struct PrimaryButtonModifier: ViewModifier {
  @Environment(\.colorScheme) var colorScheme
  
  func body(content: Content) -> some View {
    content
      .frame(maxWidth: .infinity, minHeight: 64)
      .background(AppColors.brand.color)
      .foregroundColor(.white)
      .cornerRadius(32)
      .shadow(color: colorScheme == .light ? AppColors.grey002.color : AppColors.grey002.color.opacity(0), radius: 10, x: 0, y: 4)
      .padding(.leading, 16)
      .padding(.trailing, 16)
  }
}

struct SecondaryButtonModifier: ViewModifier {
  @Environment(\.colorScheme) var colorScheme
  
  func body(content: Content) -> some View {
    content
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

extension Button {
  func primaryButton() -> some View {
    modifier(PrimaryButtonModifier())
  }
  
  func secondaryButton() -> some View {
    modifier(SecondaryButtonModifier())
  }
}
