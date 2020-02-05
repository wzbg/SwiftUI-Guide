//
//  FontListView.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/2/5.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct FontListView: View {
  var body: some View {
    List {
      ForEach(UIFont.familyNames, id:\.self) { familyName in
        Section(
          header: Text(familyName),
          footer: Text("合计：\(UIFont.fontNames(forFamilyName: familyName).count)")
        ) {
          ForEach(UIFont.fontNames(forFamilyName: familyName), id:\.self) { fontName in
            VStack {
              HStack {
                Text(fontName).font(.custom(fontName, size: 20))
                Spacer()
              }
              HStack {
                Spacer()
                Text("—— \(fontName)").font(.caption)
              }
            }
          }
        }
      }
    }
  }
}

struct FontListView_Previews: PreviewProvider {
  static var previews: some View {
    FontListView()
  }
}
