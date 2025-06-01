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

extension View {
  func primaryButton() -> some View {
    modifier(PrimaryButtonModifier())
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

func removeLast<T>(_ array: inout [T]) -> T {
  let lastElem = array[array.count - 1]
  array.remove(at: array.count - 1)
  return lastElem
}

func getHashValue<T: Hashable>(_ t: T) -> Int {
  return t.hashValue
}

func functionX<T: Decodable>(_ t: T, tType: T.Type) {
  print(T.self)
}

class ListNode<NodeValue: Equatable> {
  private let value: NodeValue

  init(value: NodeValue) {
    self.value = value
  }
}

class ListNode2<NodeValue: Collection> where NodeValue.Element: Equatable {
  private let value: NodeValue

  init(value: NodeValue) {
    self.value = value
  }
}

class ListNode3<NodeValue: Collection<Decodable>> {
  private let value: NodeValue

  init(value: NodeValue) {
    self.value = value
  }
}

protocol Container {
  associatedtype Item
  func addItem(_ item: Item)
  func removeItem(_ item: Item)
}

protocol Container2<Item> {
  associatedtype Item
  func addItem(_ item: Item)
  func removeItem(_ item: Item)
}

func parse(_ container: any Container2<Int>) {
  
}

func parse2<C: Container>(_ container: C) where C.Item == Int {
  
}
