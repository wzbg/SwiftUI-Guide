//
//  GCDownloadView.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/2/8.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct GCDownloadView: View {
  let placeholderOne = UIImage(named: "avarta3")!
  @State private var remoteImage: UIImage?
  @State private var errorMessage = ""
  
  var body: some View {
    VStack {
      Image(uiImage: remoteImage ?? placeholderOne)
        .onAppear() {
          guard let url = URL(string: "http://hdjc8.com/images/logo.png") else {
            return
          }
          DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else {
              return
            }
            self.remoteImage = UIImage(data: data)
          }
        }
      Text(errorMessage).padding()
    }
  }
}

struct GCDownloadView_Previews: PreviewProvider {
  static var previews: some View {
    GCDownloadView()
  }
}
