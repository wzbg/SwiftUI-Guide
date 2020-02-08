//
//  UploadImageView.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/2/8.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct UploadImageView: View {
  private let website = "http://www.coolketang.com/yourUploadingURL"
  @State private var message = "上传中..."
  
  var body: some View {
    Text(message)
      .onAppear() {
        guard let url = URL(string: self.website) else {
          return
        }
        let image = NSHomeDirectory() + "/Documents/logo.png"
        let imageData = try? Data(contentsOf: URL(fileURLWithPath: image))
        URLSession.shared.uploadTask(with: URLRequest(url: url), from: imageData) { data, response, error in
          guard error == nil else {
            self.message = "上传失败：\(error.debugDescription)"
            return
          }
          if let data = data {
            self.message = "上传成功：\(data)"
          }
        }.resume()
      }
  }
}

struct UploadImageView_Previews: PreviewProvider {
  static var previews: some View {
    UploadImageView()
  }
}
