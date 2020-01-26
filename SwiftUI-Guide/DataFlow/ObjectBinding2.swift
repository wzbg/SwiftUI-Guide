//
//  ObjectBinding2.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/26.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

class MyTimer: ObservableObject {
  @Published var coinNumber = 0
  
  init() {
    Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
      self.coinNumber += 1
    }
  }
}

struct ObjectBinding2: View {
  @ObservedObject var timer = MyTimer()
  
  var body: some View {
    Text("Coin number: \(timer.coinNumber)")
      .font(.largeTitle)
  }
}

struct ObjectBinding2_Previews: PreviewProvider {
  static var previews: some View {
    ObjectBinding2()
  }
}
