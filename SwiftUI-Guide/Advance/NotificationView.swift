//
//  NotificationView.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/2/6.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct NotificationView: View {
  var body: some View {
    Text("创建系统本地通知")
      .onAppear() {
        let localNotification = UILocalNotification()
        let now = Date()
        localNotification.fireDate = now.addingTimeInterval(60)
        localNotification.repeatInterval = .init(rawValue: 0)
        localNotification.timeZone = .current
        localNotification.soundName = UILocalNotificationDefaultSoundName
        localNotification.alertBody = "本地通知的信息内容"
        localNotification.applicationIconBadgeNumber = 1
        let infoDic = NSDictionary(object: "message.", forKey: "infoKey" as NSCopying)
        localNotification.userInfo = infoDic as! [AnyHashable : Any]
        UIApplication.shared.scheduleLocalNotification(localNotification)
      }
  }
}

struct NotificationView_Previews: PreviewProvider {
  static var previews: some View {
    NotificationView()
  }
}
