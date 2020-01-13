//
//  LoopFileView.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/13.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct LoopFileView: View {
  var body: some View {
    let manager = FileManager.default
    let url = NSHomeDirectory() + "/Documents"
    var contents:[String] = []
    var contents2: FileManager.DirectoryEnumerator?
    do {
      contents = try manager.contentsOfDirectory(atPath: url)
      contents2 = manager.enumerator(atPath: url)
    } catch {
      print("遍历文件夹失败: \(url)")
    }
    return VStack {
      Text(String(describing: contents2?.allObjects))
      List {
        ForEach(contents, id: \.self) {
          Text($0)
        }
      }
    }
  }
}

struct LoopFileView_Previews: PreviewProvider {
  static var previews: some View {
    LoopFileView()
  }
}
