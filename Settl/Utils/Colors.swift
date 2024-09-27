//
//  Colors.swift
//  Settl
//
//  Created by Sumit Gera on 12/09/24.
//

import SwiftUI

enum AppColors {
	case brand
  case error
  case success
  case warning
  case neutral
  case grey001
  case grey002
  case grey003
  case grey004
  case grey005
  case grey006
  case grey007
  case grey008
  case grey009
  
  var color: Color {
    switch (self) {
    case .brand:
      return Color(hex: "2962CC")
    case .error:
      return Color(red: 244, green: 67, blue: 54)
    case .success:
      return Color(red: 76, green: 175, blue: 80)
    case .warning:
      return Color(red: 255, green: 152, blue: 0)
    case .neutral:
      return Color(red: 189, green: 189, blue: 189)
    case .grey001:
      return Color(hex: "CCCFD7")
    case .grey002:
      return Color(hex: "ACB0B9")
    case .grey003:
      return Color(hex: "818895")
    case .grey004:
      return Color(hex: "596271")
    case .grey005:
      return Color(hex: "3C4556")
    case .grey006:
      return Color(hex: "2C364A")
    case .grey007:
      return Color(hex: "1D283F")
    case .grey008:
      return Color(hex: "101E3B")
    case .grey009:
      return Color(hex: "04122F")
    }
  }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = hex.hasPrefix("#") ? 1 : 0
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let b = Double(rgbValue & 0x0000FF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}
