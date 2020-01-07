//
//  Show-ActionSheet.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2020/1/7.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct Show_ActionSheet: View {
  @State var isPresented = false
  
  var body: some View {
    Button(action: {
      self.isPresented = true
    }) {
      Text("Show Action Sheet")
    }.actionSheet(isPresented: $isPresented) {
      .init(
        title: .init("Information"),
        message: .init("What's your favorite?"),
        buttons: [
          .default(Text("Fishing")) {
            print("---I like fishing")
          },
          .destructive(Text("Hunting")) {
            print("---I like hunting")
          },
          .cancel({
            print("---Nothing")
          })
        ]
      )
    }
  }
}

struct Show_ActionSheet_Previews: PreviewProvider {
  static var previews: some View {
    Show_ActionSheet()
  }
}
