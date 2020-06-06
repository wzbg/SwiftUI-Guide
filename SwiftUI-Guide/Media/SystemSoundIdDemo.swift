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
  @State var soundID: SystemSoundID = 0
  @State var playing: SystemSoundID = 0
  
  var body: some View {
    VStack {
      List(1000...1568, id: \.self) { id in
        Button("系统声音ID：\(id)") {
          self.playing = id
        }
      }
      HStack {
        Spacer()
        Button("震动") {
          self.playing = kSystemSoundID_Vibrate
        }
        Spacer()
        Button("滴答") {
          self.playing = self.soundID
        }
        Spacer()
      }
    }.onAppear {
      if let path = Bundle.main.path(forResource: "滴答", ofType: "wav") {
        let soundUrl = URL(fileURLWithPath: path)
        AudioServicesCreateSystemSoundID(soundUrl as CFURL, &self.soundID)
      }
      Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
        AudioServicesPlaySystemSound(self.playing)
      }
    }
  }
}

struct SystemSoundIdDemo_Previews: PreviewProvider {
  static var previews: some View {
    SystemSoundIdDemo()
  }
}
