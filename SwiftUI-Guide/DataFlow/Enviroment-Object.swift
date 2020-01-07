//
//  EnviromentObject.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2020/1/7.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct Enviroment_Object: View {
  @EnvironmentObject var model: UserModel
  
  var body: some View {
    NavigationView {
      VStack {
        TextField("您的昵称", text: $model.nickName)
          .padding()
        NavigationLink(destination: DetailView3()) {
          Text("显示详情")
        }
      }
    }
  }
}

struct DetailView3: View {
  @EnvironmentObject var model: UserModel

  var body: some View {
    Text("您的昵称: \(model.nickName)")
  }
}

struct Enviroment_Object_Previews: PreviewProvider {
  static var previews: some View {
    Enviroment_Object()
  }
}
