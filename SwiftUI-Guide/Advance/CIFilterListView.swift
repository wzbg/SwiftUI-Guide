//
//  CIFilterListView.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/2/8.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct CIFilterListView: View {
  var body: some View {
    List {
      ForEach(CIFilter.filterNames(inCategory: kCICategoryBuiltIn), id: \.self) {
        Text($0)
        // CIFilter(name: $0)!.attributes
      }
    }
  }
}

struct CIFilterListView_Previews: PreviewProvider {
  static var previews: some View {
    CIFilterListView()
  }
}
