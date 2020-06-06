//
//  SystemSoundIdDemo.swift
//  SwiftUI-Guide
//
//  Created by 幻冰 on 2020/6/6.
//  Copyright © 2020 unrealce. All rights reserved.
//
// http://iphonedevwiki.net/index.php/AudioServices

import SwiftUI
import AudioToolbox

struct SystemSoundIdDemo: View {
  var body: some View {
    VStack {
      List(1000...1568, id: \.self) { id in
        Button("系统声音ID：\(id)") {
          AudioServicesPlaySystemSound(id)
        }
      }
      Button("震动") {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
      }
    }
  }
}

struct SystemSoundIdDemo_Previews: PreviewProvider {
  static var previews: some View {
    SystemSoundIdDemo()
  }
}
