//
//  SearchBarView.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/2/16.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct SearchBarView: View {
  @State var text = ""
  
  var body: some View {
    VStack {
      SearchBar(text: $text, placeholder: "￠幻冰")
      Text(text)
    }
  }
}

struct SearchBarView_Previews: PreviewProvider {
  static var previews: some View {
    SearchBarView()
  }
}
