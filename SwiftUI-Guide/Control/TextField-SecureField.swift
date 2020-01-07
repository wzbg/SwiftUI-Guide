//
//  TextField-SecureField.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/30.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI

struct TextField_SecureField: View {
  @State var password : String
  
  var body: some View {
    VStack {
      Text("Your password is \(password)!")
      SecureField("Your password", text: $password) {
        print("Your password is \(self.password)!")
      }.textFieldStyle(RoundedBorderTextFieldStyle())
    }
    .padding()
  }
}

struct TextField_SecureField_Previews: PreviewProvider {
  static var previews: some View {
    TextField_SecureField(password: "")
  }
}
