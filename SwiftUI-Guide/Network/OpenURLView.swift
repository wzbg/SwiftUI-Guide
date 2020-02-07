//
//  OpenURLView.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/2/7.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct OpenURLView: View {
  @State var website = ""
  
  var body: some View {
    VStack {
      TextField("输入网页", text: $website)
        .textFieldStyle(RoundedBorderTextFieldStyle())
      Button("打开网页") {
        if let url = URL(string: self.website) {
          UIApplication.shared.openURL(url)
        }
      }
    }.padding()
  }
}

struct OpenURLView_Previews: PreviewProvider {
  static var previews: some View {
    OpenURLView()
  }
}
