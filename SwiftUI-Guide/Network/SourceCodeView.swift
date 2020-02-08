//
//  SourceCodeView.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/2/8.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct SourceCodeView: View {
  @State var code = ""
  
  var body: some View {
    Text(code)
      .onAppear() {
        let url = URL(string: "https://developer.apple.com/cn/xcode/swiftui/")
        if let url = url {
          let request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30)
          let session = URLSession.shared
          let task = session.dataTask(with: request) { data, response, error in
            guard error == nil else {
              self.code = error.debugDescription
              return
            }
            if let data = data {
              self.code = String(data: data, encoding: .utf8) ?? ""
            }
          }
          task.resume()
        }
      }
  }
}

struct SourceCodeView_Previews: PreviewProvider {
  static var previews: some View {
    SourceCodeView()
  }
}
