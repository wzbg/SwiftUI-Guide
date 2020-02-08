//
//  PerformSelectorView.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/2/8.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

class IOSApp: NSObject {
  @objc func printInformation() {
    print("Xcode互动教程")
  }
  
  @objc func buyApp(_ app: String) {
    print("购买应用程序：\(app)")
  }
}

struct PerformSelector: View {
  var body: some View {
    Text("Hello, World!")
      .onAppear() {
        let app = IOSApp()
        var selector = Selector(("printInformation"))
        if app.responds(to: selector) {
          app.perform(selector)
        }
        selector = Selector(("buyApp:"))
        if app.responds(to: selector) {
          app.perform(selector, with: "SwiftUI从入门到实战")
          app.perform(selector, with: "Swift语言入门实例互动教程", afterDelay: 2)
        }
      }
  }
}

struct PerformSelector_Previews: PreviewProvider {
  static var previews: some View {
    PerformSelector()
  }
}
