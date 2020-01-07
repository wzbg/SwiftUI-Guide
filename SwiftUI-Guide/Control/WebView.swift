//
//  WebView.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/31.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
  func makeUIView(context: Context) -> WKWebView {
    WKWebView()
  }
  
  func updateUIView(_ uiView: WKWebView, context: Context) {
    let url = "https://mp.weixin.qq.com/s/uooILaerwlT5QPI_HWES1Q"
    uiView.load(URLRequest(url: URL(string: url)!))
  }
}

struct WebView_Previews: PreviewProvider {
  static var previews: some View {
    WebView()
  }
}
