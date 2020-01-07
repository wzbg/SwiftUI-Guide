//
//  Form-EnableDisable.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2020/1/6.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct Form_EnableDisable: View {
  @State var enableForm = false
  @State var enableNotification = false
  @State var username = ""
  @State var password = ""
  
  var body: some View {
    NavigationView {
      Form {
        Toggle(isOn: $enableForm) {
          Text("启用表单")
        }
        Section(header: Text("请输入您的信息：")) {
          TextField("Username", text: $username)
          SecureField("Password", text: $password)
          Toggle(isOn: $enableNotification) {
            Text("启用通知")
          }
        }.disabled(!enableForm)
      }
    }.navigationBarTitle(Text("个人资料"))
  }
}

struct Form_EnableDisable_Previews: PreviewProvider {
  static var previews: some View {
    Form_EnableDisable()
  }
}
