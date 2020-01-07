//
//  SegmentView.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/31.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI

struct SegmentView: View {
  private var animals = ["🐶 Dog", "🐯 Tiger", "🐷 Pig"]
  @State private var selectedAnimal = 0
  
  var body: some View {
    VStack {
      Picker(selection: $selectedAnimal, label: Text("animals")) {
        ForEach(0 ..< animals.count) {
          Text(self.animals[$0]).tag($0)
        }
      }.pickerStyle(SegmentedPickerStyle())
      Text("Your choice: \(animals[selectedAnimal])")
    }
  }
}

struct SegmentView_Previews: PreviewProvider {
  static var previews: some View {
    SegmentView()
  }
}
