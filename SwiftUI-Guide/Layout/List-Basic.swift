//
//  List-Basic.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2020/1/6.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct List_Basic: View {
  @State var languages = ["Objective-C", "Swift", "Java"]
  
  var body: some View {
    List{
      ForEach(languages, id: \.self) {
        Text($0)
      }
    }
  }
}

struct List_Basic_Previews: PreviewProvider {
  static var previews: some View {
    List_Basic()
  }
}
