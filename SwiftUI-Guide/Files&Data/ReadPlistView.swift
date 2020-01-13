//
//  ReadPlistView.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/1/13.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct ReadPlistView: View {
  var body: some View {
    let plistPath = Bundle.main.path(forResource: "DemoPlist", ofType: "plist")
    let data = NSMutableDictionary.init(contentsOfFile: plistPath!)!
    let message = data.description
    let name = data["data"]
    let age = data["age"]
    print(message)
    print(name ?? "unknown name")
    print(age ?? "unknown age")
    return Text(message)
  }
}

struct ReadPlistView_Previews: PreviewProvider {
  static var previews: some View {
    ReadPlistView()
  }
}
