//
//  ManageFileView.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/13.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct ManageFileView: View {
  var body: some View {
    let manager = FileManager.default
    let swiftUrl = NSHomeDirectory() + "/Documents/swift.txt"
    let bakUrl = NSHomeDirectory() + "/Documents/swift_bak.txt"
    var msgs: [String] = []
    do {
      try manager.copyItem(atPath: swiftUrl, toPath: bakUrl)
      msgs.append("复制文件成功: \(swiftUrl) -> \(bakUrl)")
    } catch {
      msgs.append("复制文件失败: \(swiftUrl) -> \(bakUrl)")
    }
    
    let backUpUrl = NSHomeDirectory() + "/Documents/backUp"
    do {
      try manager.moveItem(atPath: bakUrl, toPath: backUpUrl)
      msgs.append("移动文件成功: \(bakUrl) -> \(backUpUrl)")
    } catch {
      msgs.append("移动文件失败: \(bakUrl) -> \(backUpUrl)")
    }
    
    do {
      try manager.removeItem(atPath: backUpUrl)
      msgs.append("删除文件成功: \(backUpUrl)")
    } catch {
      msgs.append("删除文件失败: \(backUpUrl)")
    }
    
    let folder = NSHomeDirectory() + "/Documents/txtFolder"
    let files = manager.subpaths(atPath: folder)
    files?.forEach({
      do {
        try manager.removeItem(atPath: $0)
      } catch {
      }
    })
    
    let url = NSHomeDirectory() + "/Documents"
    let contents = manager.enumerator(atPath: url)
    
    return VStack {
      Text(String(describing: contents?.allObjects))
      List {
        ForEach(msgs, id: \.self) {
          Text($0)
        }
      }
    }
  }
}

struct ManageFileView_Previews: PreviewProvider {
  static var previews: some View {
    ManageFileView()
  }
}
