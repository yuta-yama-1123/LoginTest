//
//  TokenControl.swift
//  LoginTest
//
//  Created by 山本祐太 on 2022/08/31.
//
import Foundation

class TokenControl: ObservableObject {
  // トークン
  @Published var sessionToken: String {
    didSet {
      UserDefaults.standard.set(sessionToken, forKey: "sessionToken")
    }
  }
  // 初期化処理
  init() {
    sessionToken = UserDefaults.standard.string(forKey: "sessionToken") ?? ""
  }
  
  // UserDefaultにクッキーを保存するメソッド
  func storeCookies() {
    // 現在保持されているクッキーを取り出します
    guard let cookies = HTTPCookieStorage.shared.cookies else { return }
    // UserDefaultsに保存できるデータ型に変換していきます
    var cookieDictionary = [String : AnyObject]()
    for cookie in cookies {
      cookieDictionary[cookie.name] = cookie.properties as AnyObject?
    }
    // UserDefaultsに保存します
    UserDefaults.standard.set(cookieDictionary, forKey: "sessionToken")
  }

  // UserDefaultからクッキーを取得するメソッド
  func retrieveCookies() {
    // UserDefaultsに保存してあるクッキー情報を取り出します。（この時はまだ[String : AnyObject]型）
    guard let cookieDictionary = UserDefaults.standard.dictionary(forKey: "sessionToken") else { return }
    // HTTPCookie型に変換していきます
    for (_, cookieProperties) in cookieDictionary {
      if let cookieProperties = cookieProperties as? [HTTPCookiePropertyKey : Any] {
        if let cookie = HTTPCookie(properties: cookieProperties ) {
          // クッキーをメモリ内にセットします
          HTTPCookieStorage.shared.setCookie(cookie)
        }
      }
    }
  }
}
