//
//  List-Delete.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2020/1/6.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct List_Delete: View {
  @State var languages = ["Objective-C", "Swift", "Java"]
  
  var body: some View {
    NavigationView {
      List{
        ForEach(languages, id: \.self) {
          Text($0)
        }
        .onDelete {
          if let first = $0.first {
            self.languages.remove(at: first)
          }
        }
      }
      .navigationBarTitle("Edit Row")
      .navigationBarItems(trailing: EditButton())
    }
    .padding()
  }
}

struct List_Delete_Previews: PreviewProvider {
  static var previews: some View {
    List_Delete()
  }
}
