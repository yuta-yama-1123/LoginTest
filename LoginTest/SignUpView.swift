//
//  SignUpView.swift
//  LoginTest
//
//  Created by 山本祐太 on 2022/08/29.
//

import SwiftUI
import Combine

struct SignUpView: View {
  @Environment(\.dismiss) private var dismiss
  @Environment(\ .colorScheme) var colorScheme
  
  @State var userName = ""
  @State var email = ""
  @State var password = ""
  @State var passwordConfirm = ""
  
  @State var validationUserName = ""
  @State var validationEmail = ""
  @State var validationPassword = ""
  @State var validationPasswordConfirm = ""
  
  @State var showPassword = false
  @State var showPasswordConfirm = false
  @State var isAllValid = false
  
  @State var btnColor = Color.blue
  
  var body: some View {
    NavigationView {
      VStack() {
        Text("ユーザ名")
          .frame(
            maxWidth: .infinity, alignment: .leading
          )
          .padding(
            EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
          )
        VStack { // ユーザ名入力欄、エラーメッセージ表示エリア付き
          TextField(
            "必須入力(最大20文字まで)", text: $userName
          )
            .autocapitalization(.none)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(
                EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
            )
            .onReceive(Just(userName)) { _ in validate() }
          Text(validationUserName)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(.red)
            .padding(
              EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
            )
            .font(
                .system(
                  size: 10, weight: .heavy, design: .rounded
                )
            )
        }
        Text("メールアドレス")
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(
              EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
          )
        VStack {
          TextField(
            "必須入力(メールアドレス形式)", text: $email
          )
            .autocapitalization(.none)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(
                EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
            )
            .onReceive(Just(email)) { _ in validate() }
          Text(validationEmail)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(.red)
            .padding(
              EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
            )
            .font(
              .system(
                size: 10, weight: .heavy, design: .rounded
              )
            )
        }
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
        Button("サインアップ") {
          print("test")
        }
        .disabled(!isAllValid)
        .buttonStyle(
          ActiveButton(color: btnColor)
        )
        .padding(
          EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0)
        )
      }
      .navigationBarBackButtonHidden(true)
      .navigationTitle(Text("サインアップ"))
      .navigationBarTitleDisplayMode(.inline)
    }
    .navigationBarTitle("")
    .navigationBarHidden(true)
    .navigationBarBackButtonHidden(true)
  }
  
  func validate() {
    // ユーザ名
    var isValidUserName: Bool = true
    let userNameMaxLength = 20;
    userName = userName.removingWhiteSpace()
    if (userName.count == 0) {
      isValidUserName = false
    }
    // メールアドレス
    var isValidEmail: Bool = true
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
    if (NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)) {
      validationEmail = ""
    } else {
      isValidEmail = false
      validationEmail = "メールアドレス形式で！！"
    }
  
    if (!isValidUserName || !isValidEmail) {
      // フラグ設定
      isAllValid = false
      // ボタンの色設定
      btnColor = Color(red: 0.8, green: 0.8, blue: 0.8)
      return
    }
    if (userName.count > userNameMaxLength) {
      userName = String(userName.prefix(userNameMaxLength))
    } else {
      validationUserName = ""
    }
    // フラグ設定
    isAllValid = true
    // ボタンの色設定
    btnColor = .blue
    return
  }
}

struct SignUpView_Previews: PreviewProvider {
  @State static var userName = ""
  static var previews: some View {
    SignUpView()
  }
}
