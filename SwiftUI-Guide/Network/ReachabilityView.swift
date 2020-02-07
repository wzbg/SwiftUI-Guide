//
//  ReachabilityView.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/2/7.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI
import Reachability

struct ReachabilityView: View {
  private let reachability = try! Reachability()
  @State var connectionStatus: String?
  
  var body: some View {
    Text("网络状态：\(connectionStatus ?? "获取中")")
      .onAppear() {
        let closure: (Reachability) -> () = {
          self.connectionStatus = NSLocalizedString(
            $0.connection.description,
            comment: "网络状态"
          )
        }
        self.reachability.whenReachable = closure
        self.reachability.whenUnreachable = closure
        do {
          try self.reachability.startNotifier()
        } catch {
          print("无法启动网络检测程序")
        }
      }
      .onDisappear() {
        self.reachability.stopNotifier()
      }
  }
}

struct ReachabilityView_Previews: PreviewProvider {
  static var previews: some View {
    ReachabilityView()
  }
}
