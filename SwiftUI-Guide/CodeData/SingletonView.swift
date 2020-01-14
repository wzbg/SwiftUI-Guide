//
//  SingletonView.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/14.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct SingletonView: View {
  var body: some View {
    let singleton = Singleton.singleton
    let singleton2 = Singleton.singleton
    singleton.doSomething()
    singleton2.action = "Walk"
    singleton2.doSomething()
    singleton.doSomething()
    return Text(singleton.action)
  }
}

struct SingletonView_Previews: PreviewProvider {
  static var previews: some View {
    SingletonView()
  }
}
