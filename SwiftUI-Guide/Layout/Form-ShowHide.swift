//
//  Form-ShowHide.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2020/1/6.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct Form_ShowHide: View {
  @State var hideForm = false
  @State var enableNotification = false
  @State var username = ""
  @State var password = ""
  
  var body: some View {
    NavigationView {
      Form {
        Toggle(isOn: $hideForm.animation()) {
          Text((hideForm ? "显示" : "隐藏") + "表单")
        }
        if !hideForm {
          Section(header: Text("请输入您的信息：")) {
            TextField("Username", text: $username)
            SecureField("Password", text: $password)
            Toggle(isOn: $enableNotification) {
              Text("启用通知")
            }
          }
        }
      }
    }.navigationBarTitle(Text("个人资料"))
  }
}

struct Form_ShowHide_Previews: PreviewProvider {
  static var previews: some View {
    Form_ShowHide()
  }
}
