//
//  MailBox.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/2/7.
//  Copyright © 2020 unrealce. All rights reserved.
//
// https://stackoverflow.com/questions/56784722/swiftui-send-email

import SwiftUI
import MessageUI

struct MailBox: UIViewControllerRepresentable {
  @Environment(\.presentationMode) var presentationMode
  @Binding var result: Result<MFMailComposeResult, Error>?
  
  class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
    @Binding var presentationMode: PresentationMode
    @Binding var result: Result<MFMailComposeResult, Error>?
    
    init(presentationMode: Binding<PresentationMode>, result: Binding<Result<MFMailComposeResult, Error>?>) {
      _presentationMode = presentationMode
      _result = result
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
      defer { presentationMode.dismiss() }
      guard let error = error else {
        self.result = .success(result)
        return
      }
      self.result = .failure(error)
    }
  }
  
  func makeCoordinator() -> Coordinator {
    Coordinator(presentationMode: presentationMode, result: $result)
  }
  
  func makeUIViewController(context: UIViewControllerRepresentableContext<MailBox>) -> MFMailComposeViewController {
    let compose = MFMailComposeViewController()
    compose.setToRecipients(["z@uice.xyz"])
    compose.setCcRecipients(["3530515@qq.com"])
    compose.setBccRecipients(["z35305515@gmail.com"])
    compose.setSubject("邮件标题")
    compose.setMessageBody("<font color='blue'>邮件内容</font>", isHTML: true)
    compose.addAttachmentData((UIImage(named: "Picture1")?.pngData())!, mimeType: "", fileName: "Picture1.png")
    compose.mailComposeDelegate = context.coordinator
    return compose
  }
  
  func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: UIViewControllerRepresentableContext<MailBox>) {
  }
}
