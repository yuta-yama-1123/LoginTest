//
//  CutomSecureFieldView.swift
//  LoginTest
//
//  Created by 山本祐太 on 2022/08/29.
//
//  入力内容の可視／不可視切り替えのアイコン画像の取り込みが必須
//

import SwiftUI

struct CutomSecureFieldView: View {
  // 通常モード、ダークモードで表示アイコンを切り替える
  @Environment(\ .colorScheme)var colorScheme
  
  // 可視状態フラグ
  @State var visible: Bool
  // 入力内容
  @State var value: String
  
  var placeHolder: String
  
  var body: some View {
    HStack {
      if (visible) {
        TextField(placeHolder, text: $value)
          .autocapitalization(.none)
          .textFieldStyle(RoundedBorderTextFieldStyle())
      } else {
        SecureField(placeHolder, text: $value)
          .autocapitalization(.none)
          .textFieldStyle(RoundedBorderTextFieldStyle())
      }
      Button(action: {
        visible.toggle()
      }) {
        if (visible) {
          Image(colorScheme == .light ? "eye-off_light":"eye-off_dark")
            .frame(width: 36, height: 36)
        } else {
          Image(colorScheme == .light ? "eye_light":"eye_dark")
            .frame(width: 36, height: 36)
        }
      }
    }
  }
}

struct CutomSecureFieldView_Previews: PreviewProvider {
    static var previews: some View {
        CutomSecureFieldView(
          visible: false,
          value: "テスト",
          placeHolder: "何か入力してね"
        )
    }
}
