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
  
  var body: some View {
    Button(action: {
      self.isShowingMailBox = true
    }) {
      Text("发送邮件")
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
