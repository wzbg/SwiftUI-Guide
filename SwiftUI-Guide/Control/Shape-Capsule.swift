//
//  Shape-Capsule.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/21.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct Shape_Capsule: View {
  var body: some View {
//    VStack {
//      Capsule()
//        .inset(by: 20)
//      Capsule(style: .circular)
//      Capsule(style: .continuous)
//    }
    ZStack {
      MyCapsule(color: .red, degree: 0)
      MyCapsule(color: .red, degree: 45)
      MyCapsule(color: .yellow, degree: 90)
      MyCapsule(color: .yellow, degree: 135)
      MyCapsule(color: .blue, degree: 180)
      MyCapsule(color: .blue, degree: 225)
      MyCapsule(color: .green, degree: 275)
      MyCapsule(color: .green, degree: 315)
    }
  }
}

struct MyCapsule: View {
  var color: Color
  var degree: Double
  
  var body: some View {
    Capsule()
      .frame(width: 60, height: 90)
      .foregroundColor(color)
      .offset(x: 0, y: 60)
      .rotationEffect(.degrees(degree))
      .opacity(0.75)
  }
}

struct Shape_Capsule_Previews: PreviewProvider {
  static var previews: some View {
    Shape_Capsule()
  }
}
