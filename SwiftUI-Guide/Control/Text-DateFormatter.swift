//
//  Text-DateFormatter.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/30.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI

struct Text_DateFormatter: View {
  var now = Date()
  
  static let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    return formatter
  }()
  
  var body: some View {
    Text("The time is: \(now, formatter: Self.dateFormatter)")
      .font(.title)
      .padding()
  }
}

struct Text_DateFormatter_Previews: PreviewProvider {
  static var previews: some View {
    Text_DateFormatter()
  }
}
