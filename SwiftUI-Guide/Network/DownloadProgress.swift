//
//  DownloadProgress.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/2/8.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

class DownloadManager: NSObject, ObservableObject, URLSessionDownloadDelegate {
  @Published var progress = 0.0
  
  var urlSession: URLSession {
    URLSession(
      configuration: URLSessionConfiguration.default,
      delegate: self,
      delegateQueue: nil
    )
  }
  
  func urlSession(
    _ session: URLSession,
    downloadTask: URLSessionDownloadTask,
    didFinishDownloadingTo location: URL
  ) {
    do {
      let originalPath = location.path
      print("临时路径：\(originalPath)")
      let targetPath = NSHomeDirectory() + "/Documents/logo.png"
      let fileManager = FileManager.default
      if fileManager.fileExists(atPath: targetPath) {
        try fileManager.removeItem(atPath: targetPath)
      }
      try fileManager.moveItem(atPath: originalPath, toPath: targetPath)
      print("目标路径：\(targetPath)")
    } catch {
      print("网络错误：\(error.localizedDescription)")
    }
  }
  
  func urlSession(
    _ session: URLSession,
    downloadTask: URLSessionDownloadTask,
    didWriteData bytesWritten: Int64,
    totalBytesWritten: Int64,
    totalBytesExpectedToWrite: Int64
  ) {
    DispatchQueue.main.async {
      self.progress = Double(totalBytesWritten) / Double(totalBytesExpectedToWrite)
    }
  }
  
  func urlSession(
    _ session: URLSession,
    downloadTask: URLSessionDownloadTask,
    didResumeAtOffset fileOffset: Int64,
    expectedTotalBytes: Int64) {
    print("文件偏移：\(fileOffset)")
  }
}

struct DownloadProgress: View {
  private let website = "http://hdjc8.com/images/logo.png"
  @ObservedObject var dm = DownloadManager()
  
  var body: some View {
    HStack {
      Slider(value: $dm.progress)
      Text("\(percentFormatter.string(from: NSNumber(value: dm.progress))!)")
    }
    .disabled(true)
    .padding()
    .onAppear() {
      guard let url = URL(string: self.website) else {
        return
      }
      self.dm.urlSession.downloadTask(with: url)
        .resume()
    }
  }
}

let percentFormatter: NumberFormatter = {
  let formatter = NumberFormatter()
  formatter.numberStyle = .percent
  return formatter
}()

struct DownloadProgress_Previews: PreviewProvider {
  static var previews: some View {
    DownloadProgress()
  }
}
