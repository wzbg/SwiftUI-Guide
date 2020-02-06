//
//  PhotoalbumView.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/2/6.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct PhotoAlbumView: View {
  @State var showImagePicker = false
  @State var image: Image? = nil
  @State var sourceType: UIImagePickerController.SourceType?
  
  var body: some View {
    VStack {
      Button("拍照") {
        self.sourceType = .camera
        self.showImagePicker = true
      }
      .padding()
      Button("从手机相册选择") {
        self.sourceType = .photoLibrary
        self.showImagePicker = true
      }
      image?.resizable().scaledToFit().padding()
    }
    .sheet(isPresented: $showImagePicker) {
      ImagePicker(image: self.$image, sourceType: self.sourceType)
    }
  }
}

struct PhotoAlbumView_Previews: PreviewProvider {
  static var previews: some View {
    PhotoAlbumView()
  }
}
