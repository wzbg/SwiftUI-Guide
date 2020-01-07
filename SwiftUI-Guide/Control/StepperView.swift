//
//  StepperView.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/31.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI

struct StepperView: View {
  @State var temperature = 0
  
  var body: some View {
    VStack {
      Stepper(onIncrement: {
        self.temperature += 1
      }, onDecrement: {
        self.temperature -= 1
      }, label: { Text("Temperature: \(temperature)") })
      Stepper(onIncrement: {
        self.temperature += 1
      }, onDecrement: {
        self.temperature -= 1
      }, onEditingChanged: {
        print($0)
      }, label: { Text("Temperature: \(temperature)") })
    }.padding()
  }
}

struct StepperView_Previews: PreviewProvider {
  static var previews: some View {
    StepperView()
  }
}
