//
//  TextField.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/30.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI

struct Text_TextField: View {
  @State var username : String
  @State var nickname : String
  
  var body: some View {
    VStack {
      Text("Your username is \(username)!")
      Text("Your nickname is \(nickname)!")
      TextField("User Name", text: $username, onEditingChanged: { value in
        print("onEditingChanged:\(self.username)")
      }) {
        print("onCommit:\(self.username)")
      }.textFieldStyle(RoundedBorderTextFieldStyle())
      TextField("Nick Name", text: $nickname)
        .textFieldStyle(RoundedBorderTextFieldStyle())
    }
    .padding()
  }
}

struct Text_TextField_Previews: PreviewProvider {
  static var previews: some View {
    Text_TextField(username: "", nickname: "")
  }
}
