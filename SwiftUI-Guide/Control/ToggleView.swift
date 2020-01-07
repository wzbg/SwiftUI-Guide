//
//  ToggleView.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/31.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI

struct ToggleView: View {
  @State var showNotification = true
  
  var body: some View {
    VStack {
      Text("Show Notification: ")
      +
      Text("\(showNotification.description)")
        .foregroundColor(showNotification ? .green : .red)
        .bold()
      Toggle(isOn: $showNotification) {
        Text("Show notification:")
      }.padding()
    }
  }
}

struct ToggleView_Previews: PreviewProvider {
  static var previews: some View {
    ToggleView()
  }
}
