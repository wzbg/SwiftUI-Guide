//
//  ObjectBinding.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2020/1/7.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

class UserModel: ObservableObject {
  @Published var nickName = ""
}

struct ObjectBinding: View {
  @ObservedObject var model = UserModel()
  @State var isPresented = false
  
  var body: some View {
    VStack {
      TextField("您的昵称", text: $model.nickName)
        .padding()
      Button(action: {
        self.isPresented = true
      }) {
        Text("显示")
      }.alert(isPresented: $isPresented) {
        .init(
          title: .init("您的昵称"),
          message: .init(model.nickName),
          dismissButton: .default(.init("关闭"))
        )
      }
    }
  }
}

struct ObjectBinding_Previews: PreviewProvider {
  static var previews: some View {
    ObjectBinding()
  }
}
