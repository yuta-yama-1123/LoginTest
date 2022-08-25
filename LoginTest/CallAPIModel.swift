import SwiftUI
import Alamofire
import PromiseKit

// キャラクター情報を取得したり保存したり。
class CallAPIModel {
    var constant = ConstantValuesModel()
    var responseStr: String = ""
    /*
     * loginTestApi呼び出し
     */
    func postLogin(email: String, password: String) -> Promise<String> {
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
                .validate(statusCode: 200..<300)
                .responseData { response in
                    switch response.result {
                            case .success(let data):
                            self.responseStr = String(data: data, encoding: .utf8)!
                        resolver.fulfill(String(data: data, encoding: .utf8)!)
                            case .failure(let error):
                        resolver.reject(error)
                        }
                }
        }
    }
}
