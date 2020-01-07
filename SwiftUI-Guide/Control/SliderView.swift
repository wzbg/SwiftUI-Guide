//
//  SliderView.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/31.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI

struct SliderView: View {
  @State var temperature: Double = 0
  
  var body: some View {
    VStack {
      Slider(value: $temperature)
      Slider(value: $temperature, in: -20...40)
      Slider(value: $temperature, in: -20...40) { print($0) }
      HStack {
        Image(systemName: "sun.max")
        Slider(value: $temperature, in: -20...40, step: 2) {
          print($0)
        }.accentColor(.pink).colorInvert()
        Image(systemName: "sun.max.fill")
      }.padding()
      Text("The temperature is \(temperature).")
    }
  }
}

struct SliderView_Previews: PreviewProvider {
  static var previews: some View {
    SliderView()
  }
}
