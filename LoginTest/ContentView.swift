//
//  ContentView.swift
//  LoginTest
//
//  Created by 山本祐太 on 2022/08/24.
//

import SwiftUI
import PromiseKit

struct ContentView: View {
  // API呼び出し
  var callApi = CallAPIModel()
  
  @State var email = ""
  @State var password = ""
  @State var result = ""
  
  // ログイン成否
  @State var isAuthenticated: Bool = false
  
  var body: some View {
      NavigationView {
        VStack(spacing: 20) {
            Text("ログイン")
              .bold()
            TextField("ID（半角英数）", text: $email)
              .autocapitalization(.none)
              .textFieldStyle(RoundedBorderTextFieldStyle())
              .frame(width: 300)
            SecureField("パスワード（半角英数）", text: $password)
              .autocapitalization(.none)
              .textFieldStyle(RoundedBorderTextFieldStyle())
              .frame(width: 300)
            Button(action: {
                login()
            }) {
                Text("ログイン")
            }
              .frame(width: 200, height: 60)
              .foregroundColor(Color.white)
              .background(Color.blue)
              .cornerRadius(20, antialiased: true)
            Text(result)
            NavigationLink(
              destination: MainView(),
              isActive: $isAuthenticated) {
                EmptyView()
            }
        }
          .navigationBarBackButtonHidden(true)
          .navigationBarHidden(true)
      }
  }
  
  // ログイン処理
  func login() {
    firstly {
      // 認証API呼び出し
      callApi.postLogin(
        email: email,
        password: password
      )
    }.done { loggedIn in
      if (loggedIn) {
        self.isAuthenticated.toggle()
      }
    }.catch { error in
      print(error)
      result = "ログインに失敗しました"
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
    }
}
