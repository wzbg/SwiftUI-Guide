//
//  Show-Alert.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2020/1/7.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct Show_Alert: View {
  @State var isAlert = false
  
  var body: some View {
    Button(action: {
      self.isAlert = true
    }) {
      Text("Alert Sheet")
    }.alert(isPresented: $isAlert) {
      .init(
        title: .init("Question"),
        message: .init("Are you a student?"),
        primaryButton: .default(.init("Yes")) {
          print("Yes, I'm a student.")
        },
        secondaryButton: .destructive(.init("No")) {
          print("No, I'm not a student.")
        }
      )
    }
  }
}

struct Show_Alert_Previews: PreviewProvider {
  static var previews: some View {
    Show_Alert()
  }
}
