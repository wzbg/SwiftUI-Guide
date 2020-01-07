//
//  ToggleVisibility.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/31.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI

struct ToggleVisibility: View {
  @State var showingPassword = false
  @State var password = ""
  
  var body: some View {
    VStack {
      Toggle(isOn: $showingPassword.animation(.spring())) {
        Text("显示密码框")
      }
      if showingPassword {
        SecureField("Password", text: $password)
          .padding()
          .border(Color.green, width: 1)
      }
    }.padding()
  }
}

struct ToggleVisibility_Previews: PreviewProvider {
  static var previews: some View {
    ToggleVisibility()
  }
}
