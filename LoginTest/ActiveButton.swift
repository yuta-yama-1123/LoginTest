//
//  ActiveButton.swift
//  LoginTest
//
//  Created by 山本祐太 on 2022/08/30.
//

import SwiftUI
import Combine

struct ActiveButton: ButtonStyle {
  let color: Color
  
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .frame(width: 200, height: 60, alignment: .center)
      .foregroundColor(Color.white)
      .background(color)
      .clipShape(Capsule())
  }
}
