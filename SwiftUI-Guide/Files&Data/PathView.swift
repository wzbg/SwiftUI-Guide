//
//  PathView.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/13.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct PathView: View {
  var body: some View {
    let homePath = NSHomeDirectory()
    let docPaths = NSSearchPathForDirectoriesInDomains(
      .documentDirectory,
      .userDomainMask,
      true)
    let libPaths = NSSearchPathForDirectoriesInDomains(
      .libraryDirectory,
      .userDomainMask,
      true)
    let cachePaths = NSSearchPathForDirectoriesInDomains(
      .cachesDirectory,
      .userDomainMask,
      true)
    let tmpPath = NSTemporaryDirectory()
    return VStack {
      Text(homePath)
      List { ForEach(docPaths, id: \.self) { Text($0) } }
      List { ForEach(libPaths, id: \.self) { Text($0) } }
      List { ForEach(cachePaths, id: \.self) { Text($0) } }
      Text(tmpPath)
    }
  }
}

struct PathView_Previews: PreviewProvider {
  static var previews: some View {
    PathView()
  }
}
