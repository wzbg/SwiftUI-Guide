//
//  ContextMenu.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/25.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct ContextMenu: View {
  var body: some View {
    VStack(spacing: 20) {
      Image(systemName: "gear")
        .font(.system(size: 64))
      Text("设置")
        .font(.system(size: 16))
    }
    .contextMenu {
      VStack {
        Button(action: {
          print("留言")
        }) {
          Text("留言")
          Image(systemName: "message")
        }
        Button(action: {
          print("评价")
        }) {
          Text("评价")
          Image(systemName: "star")
        }
      }
    }
  }
}

struct ContextMenu_Previews: PreviewProvider {
  static var previews: some View {
    ContextMenu()
  }
}
