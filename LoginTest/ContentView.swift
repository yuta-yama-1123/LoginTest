//
//  ContentView.swift
//  LoginTest
//
//  Created by 山本祐太 on 2022/08/24.
//

import SwiftUI
import PromiseKit

struct ContentView: View {
    var callApi = CallAPIModel()
    @State var str1 = "test@test.com"
    @State var str2 = "secret"
    @State var str3 = ""
    
    @State private var show: Bool = false
     var body: some View {
         NavigationView {
         VStack(spacing: 20) {
             Text("アカウントIDでログイン")
                 .bold()
             TextField("ID（半角英数）", text: $str1)
                 .textFieldStyle(RoundedBorderTextFieldStyle())
                 .frame(width: 300)
             TextField("パスワード（半角英数）", text: $str2)
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
             .cornerRadius(10, antialiased: true)
             Text(str3)
             NavigationLink(destination: MainView(),
                            isActive: $show) {
                             EmptyView()
             }
         }
         }
     }
    
    func login() {
        print("押忍")
        firstly {
            callApi.postLogin(email: str1, password: str2)
        }.done { str in
            print(str)
            if (str == "Hello World!\n") {
                print("yeah")
                self.show.toggle()
            } else {
                print("damn")
            }

        }.catch { str in
            print(str)
        }
    }
 }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
    }
}
