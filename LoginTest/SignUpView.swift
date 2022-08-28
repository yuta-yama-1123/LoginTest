//
//  SignUpView.swift
//  LoginTest
//
//  Created by 山本祐太 on 2022/08/29.
//

import SwiftUI

struct SignUpView: View {
  @Environment(\.dismiss) private var dismiss
  @Environment(\ .colorScheme)var colorScheme
  
  @State var userName = ""
  @State var email = ""
  @State var password = ""
  @State var passwordConfirm = ""
  
  @State var showPassword = false
  @State var showPasswordConfirm = false
  
  var body: some View {
    NavigationView {
      VStack() {
        Text("ユーザ名")
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(
            EdgeInsets(
                top: 0,       // 上の余白
                leading: 20,    // 左の余白
                bottom: 0,     // 下の余白
                trailing: 20    // 右の余白
            )
          )
        TextField("", text: $userName)
          .autocapitalization(.none)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .padding(
              EdgeInsets(
                  top: 0,       // 上の余白
                  leading: 20,    // 左の余白
                  bottom: 20,     // 下の余白
                  trailing: 20    // 右の余白
              )
          )
        Text("メールアドレス")
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(
            EdgeInsets(
                top: 0,       // 上の余白
                leading: 20,    // 左の余白
                bottom: 0,     // 下の余白
                trailing: 20    // 右の余白
            )
          )
        TextField("（半角英数）", text: $email)
          .autocapitalization(.none)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .padding(
              EdgeInsets(
                  top: 0,       // 上の余白
                  leading: 20,    // 左の余白
                  bottom: 20,     // 下の余白
                  trailing: 20    // 右の余白
              )
          )
        Text("パスワード")
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(
            EdgeInsets(
                top: 0,       // 上の余白
                leading: 20,    // 左の余白
                bottom: 0,     // 下の余白
                trailing: 20    // 右の余白
            )
          )
        CutomSecureFieldView(
          visible: showPassword,
          value: password,
          placeHolder: "半角英数字記号、8文字以上"
        )
        .padding(
            EdgeInsets(
                top: 0,       // 上の余白
                leading: 20,    // 左の余白
                bottom: 0,     // 下の余白
                trailing: 20    // 右の余白
            )
        )
        CutomSecureFieldView(
          visible: showPasswordConfirm,
          value: passwordConfirm,
          placeHolder: "パスワードと同じ内容を入力"
        )
        .padding(
            EdgeInsets(
                top: 10,       // 上の余白
                leading: 20,    // 左の余白
                bottom: 0,     // 下の余白
                trailing: 20    // 右の余白
            )
        )
        Button(action: {
          dismiss()
        }) {
          Text("サインアップ")
        }
          .frame(width: 200, height: 60)
          .foregroundColor(Color.white)
          .background(Color.blue)
          .cornerRadius(20, antialiased: true)
          .padding(
              EdgeInsets(
                  top: 60,       // 上の余白
                  leading: 0,    // 左の余白
                  bottom: 0,     // 下の余白
                  trailing: 0    // 右の余白
              )
          )
      }
      .padding()
      .navigationBarBackButtonHidden(true)
      .navigationTitle(Text("サインアップ"))
      .navigationBarTitleDisplayMode(.inline)
    }
    .navigationBarTitle("")
    .navigationBarHidden(true)
    .navigationBarBackButtonHidden(true)
  }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
