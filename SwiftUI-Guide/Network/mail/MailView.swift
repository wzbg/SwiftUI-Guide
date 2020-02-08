//
//  MailComposeView.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/2/7.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI
import MessageUI

struct MailView: View {
  @State var result: Result<MFMailComposeResult, Error>?
  @State var isShowingMailBox = false
  
  var resultDescription: String {
    guard let result = result else {
      return "未发送"
    }
    do {
      let compose = try result.get()
      switch compose {
        case .cancelled: return "取消发送"
        case .failed: return "发送失败"
        case .saved: return "保存成功"
        case .sent: return "发送成功"
        default: return "未知状态: \(compose.rawValue)"
      }
    } catch {
      return error.localizedDescription
    }
  }
  
  var body: some View {
    VStack {
      Button(action: {
        self.isShowingMailBox = true
      }) {
        Text("发送邮件")
      }
      Text("发送结果：\(resultDescription)")
        .foregroundColor(Color(UIColor(named: "FontColor")!))
        .padding()
    }
    .disabled(!MFMailComposeViewController.canSendMail())
    .sheet(isPresented: $isShowingMailBox) {
      MailBox(result: self.$result)
    }
  }
}

struct MailView_Previews: PreviewProvider {
  static var previews: some View {
    MailView()
  }
}
