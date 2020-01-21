//
//  Shape-Path.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/31.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI

struct Shape_Path: View {
  var body: some View {
    VStack {
      Path {
        $0.move(to: CGPoint(x: 30, y: 0))
        $0.addLine(to: CGPoint(x: 30, y: 200))
        $0.addLine(to: CGPoint(x: 230, y: 200))
        $0.addLine(to: CGPoint(x: 230, y: 0))
        
        $0.move(to: CGPoint(x: 30, y: 300))
        $0.addQuadCurve(
          to: CGPoint(x: 230, y: 300),
          control: CGPoint(x: 130, y: 450)
        )
        $0.addQuadCurve(
          to: CGPoint(x: 330, y: 300),
          control: CGPoint(x: 280, y: 220)
        )
      }.stroke(lineWidth: 8)
      Path {
        $0.addEllipse(in: CGRect(x: 100, y: 30, width: 200, height: 200))
        $0.addRoundedRect(
          in: CGRect(x: 100, y: 120, width: 200, height: 200),
          cornerSize: CGSize(width: 10, height: 10)
        )
        $0.addEllipse(in: CGRect(x: 100, y: 210, width: 200, height: 200))
      }
    }
  }
}

struct Shape_Path_Previews: PreviewProvider {
  static var previews: some View {
    Shape_Path()
  }
}
