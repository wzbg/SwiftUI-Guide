//
//  CreatePlistView.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/13.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct CreatePlistView: View {
  var body: some View {
    let dic = NSMutableDictionary()
    dic.setObject("huanbing", forKey: "name" as NSCopying)
    dic.setObject(200, forKey: "age" as NSCopying)
    let plistPath = NSHomeDirectory() + "/Documents/DemoPlist2.plist"
    dic.write(toFile: plistPath, atomically: true)
    let data = NSMutableDictionary.init(contentsOfFile: plistPath)!
    let message = data.description
    return Text(message)
  }
}

struct CreatePlistView_Previews: PreviewProvider {
  static var previews: some View {
    CreatePlistView()
  }
}
