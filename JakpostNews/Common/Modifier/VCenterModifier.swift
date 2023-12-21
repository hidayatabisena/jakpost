//
//  VCenterModifier.swift
//  JakpostNews
//
//  Created by Hidayat Abisena on 21/12/23.
//

import SwiftUI

struct VCenterModifier: ViewModifier {
  func body(content: Content) -> some View {
    VStack {
      Spacer()
      content
      Spacer()
    }
  }
}
