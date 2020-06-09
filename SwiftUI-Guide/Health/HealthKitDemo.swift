//
//  HealthKitDemo.swift
//  SwiftUI-Guide
//
//  Created by 幻冰 on 2020/6/9.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI
import HealthKit

struct HealthKitDemo: View {
  var body: some View {
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
      .onAppear {
        let healthStore = HKHealthStore()
        let toRead = Set(arrayLiteral:
          HKObjectType.quantityType(forIdentifier: .height)!,
          HKObjectType.quantityType(forIdentifier: .bodyMass)!,
          HKObjectType.quantityType(forIdentifier: .bodyFatPercentage)!
        )
        healthStore.requestAuthorization(toShare: nil, read: toRead) { result, error in
          guard let error = error else {
            print("result: \(result)")
            return
          }
          print("error: \(error.localizedDescription)")
        }
      }
  }
}

struct HealthKitDemo_Previews: PreviewProvider {
  static var previews: some View {
    HealthKitDemo()
  }
}
