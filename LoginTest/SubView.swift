//
//  SubView.swift
//  LoginTest
//
//  Created by 山本祐太 on 2022/08/27.
//

import SwiftUI
import PromiseKit

struct SubView: View {
  @Environment(\.dismiss) private var dismiss
  @Binding var sessionExpired: Bool
  var callApi = CallAPIModel()
  @State var message = ""
  var body: some View {
      VStack {
        Text("SubView")
          .padding()
        Button( action: { touch() }) {
            Text("Call API")
        }
        Text(message)
      }
    .navigationBarTitle("")
    .navigationBarHidden(true)
    .navigationBarBackButtonHidden(true)
  }
  
  func touch() {
    firstly {
      callApi.touch()
    }.done { touched in
      if (touched) {
        callApi.printCookies()
        message = "セッションは有効です"
      } else {
        callApi.printCookies()
        // 画面を閉じ、親画面にセッション有効期限切れを伝える
        sessionExpired = true
        dismiss()
      }
    }.catch { error in
      print(error)
      callApi.printCookies()
      // 画面を閉じ、親画面にセッション有効期限切れを伝える
      sessionExpired = true
      dismiss()
    }
  }
}

struct SubView_Previews: PreviewProvider {
    @State static var sessionExpired = true
    static var previews: some View {
      SubView(sessionExpired: $sessionExpired)
    }
}
