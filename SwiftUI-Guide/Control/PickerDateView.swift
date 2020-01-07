//
//  PickerDateView.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/31.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI

struct PickerDateView: View {
  var myDateFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    return formatter
  }

  @State var selectedDate = Date()
  
  var body: some View {
    VStack {
      DatePicker(
        selection: $selectedDate,
        displayedComponents: .hourAndMinute,
        label: { Text("Time") }
      )
      DatePicker(
        selection: $selectedDate,
        displayedComponents: .date,
        label: { Text("Date") }
      )
      DatePicker(
        selection: $selectedDate,
        in: Date() ... Date().advanced(by: 7 * 24 * 60 * 60),
        displayedComponents: [.date, .hourAndMinute],
        label: { Text("Range") }
      )
      Text("Your Choice: \(selectedDate, formatter: myDateFormatter)")
    }
  }
}

struct PickerDateView_Previews: PreviewProvider {
  static var previews: some View {
    PickerDateView()
  }
}
