//
//  Form-Segment.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2020/1/6.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct Form_Segment: View {
  @State var languages = ["Objective-C", "Swift", "Java"]
  @State private var selectedLanguage = 1
  @State var workingYear = 2.0
  @State var enableNotification = false
  
  var body: some View {
    NavigationView {
      Form {
        Section(
          header: Text("请输入您的信息："),
          footer: Text("注意：启用通知以获取更多信息")
        ) {
          Picker(selection: $selectedLanguage, label: Text("语言")) {
            ForEach(0 ..< languages.count) {
              Text(self.languages[$0]).tag($0)
            }
          }.pickerStyle(SegmentedPickerStyle())
          HStack {
            Text("工作年限")
            Slider(value: $workingYear, in: 1...10, step: 1)
          }
          Toggle(isOn: $enableNotification) {
            Text("启用通知")
          }
        }
        Button(action: {
          print("选择语言: \(self.languages[self.selectedLanguage])")
          print("工作年限: \(Int(self.workingYear))")
          print("启用通知: \(self.enableNotification)")
        }) {
          Text("提交")
        }
      }
    }.navigationBarTitle(Text("个人资料"))
  }
}

struct Form_Segment_Previews: PreviewProvider {
  static var previews: some View {
    Form_Segment()
  }
}
