//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by Manoel Filho on 16/04/21.
//

import SwiftUI

struct CenterModifier: ViewModifier {
  func body(content: Content) -> some View {
    HStack {
      Spacer()
      content
      Spacer()
    }
  }
}
