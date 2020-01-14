//
//  SingletonClass.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/14.
//  Copyright © 2020 unrealce. All rights reserved.
//

class Singleton {
  var action = "Run"
  
  static let singleton = Singleton()
  
  func doSomething() {
    print(action)
  }
}
