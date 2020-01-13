//
//  EventHandleView.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/13.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct UserDefaultsView: View {
  var body: some View {
    if !UserDefaults.standard.bool(forKey: "everLaunched") {
      UserDefaults.standard.set(true, forKey: "everLaunched")
      UserDefaults.standard.set(true, forKey: "firstLaunched")
      UserDefaults.standard.synchronize()
    } else {
      UserDefaults.standard.set(false, forKey: "firstLaunched")
      UserDefaults.standard.synchronize()
    }
    let message = UserDefaults.standard.bool(forKey: "firstLaunched") ? "首次启动" : "多次启动"
    return Text(message)
  }
}

struct UserDefaultsView_Previews: PreviewProvider {
  static var previews: some View {
    UserDefaultsView()
  }
}
