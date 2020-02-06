//
//  PositionView.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/2/5.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct LocationView: View {
  @ObservedObject var lm = LocationManager()
  
  var latitude: String { "\(lm.location?.latitude)" }
  var longitude: String { "\(lm.location?.longitude)" }
  var placemark: String { lm.placemark?.description ?? "未知地标" }
  var status: String { "\(lm.status?.rawValue)" }
  
  var body: some View {
    VStack {
      Text("纬度: \(latitude)")
      Text("经度: \(longitude)")
      Text("地标: \(placemark)")
      Text("状态: \(status)")
    }
  }
}

struct LocationView_Previews: PreviewProvider {
  static var previews: some View {
    LocationView()
  }
}
