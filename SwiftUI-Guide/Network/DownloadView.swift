//
//  DownloadView.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/2/8.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct DownloadView: View {
  private let placeholderOne = UIImage(named: "avarta3")
  @State private var remoteImage : UIImage?
  @State private var errorMessage : String = ""
  
  var body: some View {
    VStack {
      Image(uiImage: self.remoteImage ?? placeholderOne!)
        .onAppear {
          guard let url = URL(string: "http://hdjc8.com/images/logo.png") else {
            return
          }
          URLSession.shared.downloadTask(with: url) { location, response, error in
            do {
              if let originalPath = location?.path {
                self.errorMessage = originalPath
                let targetPath = NSHomeDirectory() + "/Documents/logo.png"
                let fileManager = FileManager.default
                if fileManager.fileExists(atPath: targetPath) {
                  try fileManager.removeItem(atPath: targetPath)
                }
                try fileManager.moveItem(atPath: originalPath, toPath: targetPath)
                let data = try Data(contentsOf: URL(fileURLWithPath: targetPath))
                self.remoteImage = UIImage(data: data)
              }
            } catch {
              self.errorMessage = error.localizedDescription
            }
          }.resume()
        }
      Text(errorMessage).padding()
    }
  }
}

struct DownloadView_Previews: PreviewProvider {
  static var previews: some View {
    DownloadView()
  }
}
