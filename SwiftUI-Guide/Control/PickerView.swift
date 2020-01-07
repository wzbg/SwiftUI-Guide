//
//  PickerView.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/31.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI

struct PickerView: View {
  var fruits = ["Apple", "Banner", "Pear", "Watermelon"]
  var colors = [Color.blue, Color.orange, Color.red, Color.purple]
  @State private var selectedItem = 0
  
  var body: some View {
    VStack {
      Picker(selection: $selectedItem, label: Text("Fruits")) {
        ForEach(0 ..< fruits.count) {
          Text(self.fruits[$0]).tag($0).foregroundColor(self.colors[$0])
        }
      }
      Text("Your choice: ")
      +
      Text("\(fruits[selectedItem])")
        .foregroundColor(self.colors[selectedItem])
    }
  }
}

struct PickerView_Previews: PreviewProvider {
  static var previews: some View {
    PickerView()
  }
}
