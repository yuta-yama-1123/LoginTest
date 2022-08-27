import SwiftUI
import Alamofire
import PromiseKit

// キャラクター情報を取得したり保存したり。
class CallAPIModel {
    var constant = ConstantValuesModel()
    var responseStr: String = ""
  
  // loginTestApi呼び出し -> Promise<Bool>で返却
  func postLogin(email: String, password: String) -> Promise<Bool> {
    return Promise { resolver in
      let requestUrl = constant.apiDomain + "/login"
      let param: Parameters = [
        "email": email,
        "password": password
      ]
      let headers: HTTPHeaders = [
        "Content-Type":"application/x-www-form-urlencoded; charset=UTF-8"
      ]
      AF // Alamofire
        .request(
          requestUrl,
          method: .post,
          parameters: param,
          encoding: URLEncoding.httpBody,
          headers: headers
        )
        .validate()
        .responseData { response in
          print(response.response?.statusCode)
          switch response.result {
          case .success(_):
            //self.responseStr = String(data: data, encoding: .utf8)!
            resolver.fulfill(true)
          case .failure(let error):
            resolver.reject(error)
          }
        }
    }
  }
  // TouchApi呼び出し -> Promise<Bool>で返却
  // セッション有効確認
  func touch() -> Promise<Bool> {
    return Promise { resolver in
      let requestUrl = constant.apiDomain + "/touch"
      let headers: HTTPHeaders = [
        "Content-Type":"application/x-www-form-urlencoded; charset=UTF-8"
      ]
      AF // Alamofire
        .request(
          requestUrl,
          method: .get,
          headers: headers
        )
        .validate()
        .responseData { response in
          switch response.result {
          case .success(_):
            resolver.fulfill(true)
          case .failure(let error):
            resolver.reject(error)
          }
        }
    }
  }
  
  // HTTPCookieStorageの内容を確認
  func printCookies() {
    // Cookieの取得方法
    if let cookies = HTTPCookieStorage.shared.cookies(for: URL(string: constant.apiDomain)!) {
      for cookie in cookies {
        print(cookie)
      }
    }
  }
}
