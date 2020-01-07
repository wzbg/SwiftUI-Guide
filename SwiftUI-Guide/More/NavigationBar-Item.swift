//
//  NavigationBar-Item.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2020/1/7.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct NavigationBar_Item: View {
  var body: some View {
    NavigationView {
      Text("SwiftUI's NavigationView")
        .navigationBarTitle("SwiftUI")
        .navigationBarItems(
          leading: Button(action: {
            print("Go to index page")
          }) {
            Text("Index")
          },
          trailing: HStack {
            Button(action: {
              print("Download the data")
            }) {
              Image(systemName: "icloud.and.arrow.down.fill")
            }
            Button(action: {
              print("Edit the data")
            }) {
              Image(systemName: "pencil.tip.crop.circle")
            }
          }
        )
    }
  }
}

struct NavigationBar_Item_Previews: PreviewProvider {
  static var previews: some View {
    NavigationBar_Item()
  }
}
