//
//  GitHubView.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/2/8.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct GitHubView: View {
  @State var code = ""
  
  var body: some View {
    Text(code)
      .onAppear() {
        let url = URL(string: "https://github.com/wzbg/base58check")
        if let url = url {
          let request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30)
          let session = URLSession.shared
          let task = session.dataTask(with: request) { data, response, error in
            guard error == nil else {
              self.code = error.debugDescription
              return
            }
            if let data = data {
              let result = String(data: data, encoding: .utf8)
              DispatchQueue.main.async {
                self.code = result ?? ""
              }
            }
          }
          task.resume()
        }
      }
  }
}

struct GitHubView_Previews: PreviewProvider {
  static var previews: some View {
    GitHubView()
  }
}
