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
  let healthStore = HKHealthStore()
  
  @State var height = 0.0
  @State var weight = 0.0
  @State var BFP = 0.0
  @State var BMI = 0.0
  @State var LBM = 0.0
  
  var body: some View {
    Form {
      HStack {
        Text("身高")
        Spacer()
        Text(String(format: "%.1f", height * 100)) + Text("厘米").font(.caption)
      }
      HStack {
        Text("体重")
        Spacer()
        Text(String(format: "%.1f", weight * 2)) + Text("斤").font(.caption)
      }
      HStack {
        Text("体脂")
        Spacer()
        Text(String(format: "%.1f", BFP * 100)) + Text("%").font(.caption)
      }
      HStack {
        Text("身高体重指数（BMI）")
        Spacer()
        Text(String(format: "%.2f", BMI))
      }
      HStack {
        Text("去脂体重/廋体重（LBM）")
        Spacer()
        Text(String(format: "%.2f", LBM * 2)) + Text("斤").font(.caption)
      }
    }.onAppear {
      let toRead = [
        HKObjectType.quantityType(forIdentifier: .height)!,
        HKObjectType.quantityType(forIdentifier: .bodyMass)!,
        HKObjectType.quantityType(forIdentifier: .bodyFatPercentage)!,
        HKObjectType.quantityType(forIdentifier: .bodyMassIndex)!,
        HKObjectType.quantityType(forIdentifier: .leanBodyMass)!
      ]
      self.healthStore.requestAuthorization(toShare: nil, read: Set(toRead)) { result, error in
        guard let error = error else {
          print("request authorization result: \(result)")
          toRead.forEach {
            self.getMostRecentSample(for: $0) {
              guard let sample = $0 else {
                if let error = $1 {
                  print("get most recent sample error: \(error.localizedDescription)")
                }
                return
              }
              switch sample.quantityType {
                case toRead[0]:
                  self.height = sample.quantity.doubleValue(for: .meter())
                  break
                case toRead[1]:
                  self.weight = sample.quantity.doubleValue(for: .gramUnit(with: .kilo))
                  break
                case toRead[2]:
                  self.BFP = sample.quantity.doubleValue(for: .percent())
                  break
                case toRead[3]:
                  self.BMI = sample.quantity.doubleValue(for: .count())
                  break
                case toRead[4]:
                  self.LBM = sample.quantity.doubleValue(for: .gramUnit(with: .kilo))
                  break
                default: break
              }

            }
          }
          return
        }
        print("request authorization error: \(error.localizedDescription)")
      }
    }
  }
  
  func getMostRecentSample(for sampleType: HKSampleType, completion: @escaping (HKQuantitySample?, Error?) -> Void) {
    let mostRecentPredicate = HKQuery.predicateForSamples(withStart: Date.distantPast, end: Date(), options: .strictEndDate)
    let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
    let limit = 1
    let sampleQuery = HKSampleQuery(sampleType: sampleType,
                                    predicate: mostRecentPredicate,
                                    limit: limit,
                                    sortDescriptors: [sortDescriptor]) { (query, samples, error) in
        DispatchQueue.main.async {
          guard let samples = samples, let mostRecentSample = samples.first as? HKQuantitySample else {
            completion(nil, error)
            return
          }
          completion(mostRecentSample, nil)
        }
    }
    healthStore.execute(sampleQuery)
  }
}

struct HealthKitDemo_Previews: PreviewProvider {
  static var previews: some View {
    HealthKitDemo()
  }
}
