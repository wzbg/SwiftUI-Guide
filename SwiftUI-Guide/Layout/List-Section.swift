//
//  List-Section.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/21.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct List_Section: View {
  var body: some View {
    List {
      Section(header: Text("水果"), footer: Text("总数：3")) {
        Text("🍎")
        Text("🍌")
        Text("🍐")
      }
      Section(header: Text("动物"), footer: Text("总数：4")) {
        Text("🐯")
        Text("🦁️")
        Text("🐒")
        Text("🐰")
      }
    }
  }
}

struct List_Section_Previews: PreviewProvider {
  static var previews: some View {
    List_Section()
  }
}
