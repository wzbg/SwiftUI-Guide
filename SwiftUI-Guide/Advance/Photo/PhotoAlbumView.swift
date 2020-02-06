//
//  PhotoalbumView.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/2/6.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct PhotoAlbumView: View {
  @State var showImagePicker: Bool = false
  @State var image: Image? = nil

  var body: some View {
    ZStack {
      VStack {
        Button("选择一张图片") {
          withAnimation {
            self.showImagePicker.toggle()
          }
        }
        image?.resizable().scaledToFit().padding()
      }
      .sheet(isPresented: $showImagePicker) {
        ImagePicker(image: self.$image)
      }
    }
  }
}

struct PhotoAlbumView_Previews: PreviewProvider {
  static var previews: some View {
    PhotoAlbumView()
  }
}
