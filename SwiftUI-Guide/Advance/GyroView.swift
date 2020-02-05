//
//  GyroView.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/2/5.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI
import CoreMotion

struct GyroView: View {
  @State private var message = "加载中..."
  
  var body: some View {
    Text(message)
      .onAppear() {
        let motionManager = CMMotionManager()
        motionManager.accelerometerUpdateInterval = 0.1
        if !motionManager.isAccelerometerAvailable {
          self.message = "您的设备不支持加速仪"
        }
        motionManager.startAccelerometerUpdates(to: .main) { data, error in
          if error != nil {
            motionManager.stopAccelerometerUpdates()
            return
          }
          if let data = data {
            self.message = "X: \(data.acceleration.x)\n"
              + "Y: \(data.acceleration.y)\n"
              + "Z: \(data.acceleration.z)\n"
          }
        }
      }
  }
}

struct GyroView_Previews: PreviewProvider {
  static var previews: some View {
    GyroView()
  }
}
