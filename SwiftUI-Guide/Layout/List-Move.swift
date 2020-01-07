//
//  List-Move.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2020/1/6.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct List_Move: View {
  @State var languages = ["Objective-C", "Swift", "Java"]
  
  var body: some View {
    NavigationView {
      List{
        ForEach(languages, id: \.self) {
          Text($0)
        }
        .onMove { source, destination in
          self.languages.move(fromOffsets: source, toOffset: destination)
          print(self.languages)
        }
      }
      .navigationBarTitle("Edit Row")
      .navigationBarItems(trailing: EditButton())
    }
    .padding()
  }
}

struct List_Move_Previews: PreviewProvider {
  static var previews: some View {
    List_Move()
  }
}
