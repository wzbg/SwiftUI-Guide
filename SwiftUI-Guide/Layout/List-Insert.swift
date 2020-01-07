//
//  List-Insert.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2020/1/6.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct List_Insert: View {
  @State var languages = ["Objective-C", "Swift", "Java"]
  
  var body: some View {
    NavigationView {
      List{
        ForEach(languages, id: \.self) {
          Text($0)
        }
        .onInsert(of: ["Go"]) { offsets, message in
          self.languages.insert(message[0].description, at: offsets)
          print(self.languages)
        }
      }
      .navigationBarTitle("Edit Row")
      .navigationBarItems(trailing: EditButton())
    }
    .padding()
  }
  
  func insertItem(to offsets: Int, message : [NSItemProvider]) {
    languages.insert(message[0].description, at: offsets)
  }
}

struct List_Insert_Previews: PreviewProvider {
  static var previews: some View {
    List_Insert()
  }
}
