//
//  List-DragGesture.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/2/15.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct List_DragGesture: View {
  @State var animals = [
    "🐭", "🐂", "🐯", "🐰", "🐲", "🐍",
    "🐎", "🐑", "🐒", "🐔", "🐶", "🐷"
  ]
  
  var body: some View {
    List {
      ForEach(animals, id: \.self) {
        Text($0)
      }
    }
    .gesture(DragGesture()
      .onChanged({
        print("changed: \($0)")
      })
      .onEnded({
        print("end: \($0)")
      })
    )
  }
}

struct List_DragGesture_Previews: PreviewProvider {
  static var previews: some View {
    List_DragGesture()
  }
}
