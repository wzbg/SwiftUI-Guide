//
//  SDWebImageView.swift
//  SwiftUI-Guide
//
//  Created by 幻冰 on 2020/6/19.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct SDWebImageView: View {
  var body: some View {
    ScrollView {
      WebImage(url: URL(string: "https://mmbiz.qpic.cn/mmbiz_jpg/vEKqYFacechLENxXVX6s3KlLWFf0s75C0KBc4btFqyE06h9ibmKZNTDMb2Vw5UicGvbetwJ3H8SsYPdkY2J1fUOw/0?wx_fmt=jpeg"))
      AnimatedImage(url: URL(string: "https://mmbiz.qpic.cn/mmbiz_gif/Tia9oKjKIibgzVYt2CJiaPvlw4OcweiaicHS6ZDicVeME9tlOQwQsRBlBozicw2Z3FLNIMjd3IF9rxYQuUrxq0telBRFA/640?wx_fmt=gif"))
        .scaledToFit()
      AnimatedImage(data: try! Data(contentsOf: URL(string: "https://isparta.github.io/compare-webp/image/png_webp/webp_lossless/3.webp")!))
        .scaledToFit()
    }.edgesIgnoringSafeArea(.all)
  }
}

struct SDWebImageView_Previews: PreviewProvider {
  static var previews: some View {
    SDWebImageView()
  }
}
