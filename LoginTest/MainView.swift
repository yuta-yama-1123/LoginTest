//
//  MainView.swift
//  LoginTest
//
//  Created by 山本祐太 on 2022/08/26.
//

import SwiftUI

struct MainView: View {
  @Environment(\.dismiss) private var dismiss

  @State private var isShowSubView = false
  @State private var sessionExpired = false
  var body: some View {
    NavigationView {
      VStack {
        Text("MainView")
          .padding()
        Button( action: { isShowSubView.toggle() }) {
            Text("Move to SubView")
        }
        NavigationLink(
          destination: SubView(
            sessionExpired: $sessionExpired),
          isActive: $isShowSubView) {
          EmptyView()
      }
        .onAppear{
          if (sessionExpired) {
            dismiss()
          }
        }
    }
      .navigationBarBackButtonHidden(true)
      .navigationBarTitle("")
      .navigationBarHidden(true)
  }
    .navigationBarTitle("")
    .navigationBarHidden(true)
    .navigationBarBackButtonHidden(true)
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
