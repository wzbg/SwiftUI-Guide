//
//  CreateFileView.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/13.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct CreateFolderView: View {
  var body: some View {
    let manager = FileManager.default
    let baseUrl = NSHomeDirectory() + "/Documents/txtFolder"
    let exist = manager.fileExists(atPath: baseUrl)
    var message = "文件夹: \(baseUrl)"
    if !exist {
      do {
        try manager.createDirectory(
          atPath: baseUrl,
          withIntermediateDirectories: true,
          attributes: nil)
        message = "创建文件夹成功: \(baseUrl)"
      } catch {
        message = "创建文件夹失败: \(baseUrl)"
      }
    }
    return Text(message)
  }
}

struct CreateFolderView_Previews: PreviewProvider {
  static var previews: some View {
    CreateFolderView()
  }
}
