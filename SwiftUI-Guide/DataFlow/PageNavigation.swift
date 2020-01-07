//
//  PageNavigation.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2020/1/7.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct InfoModel : Hashable {
  var description: String
  var pictureName: String
}

struct PageNavigation: View {
  var messages : [InfoModel]
  
  var body: some View {
    NavigationView{
      List{
        ForEach(messages, id: \.self) { message in
          NavigationLink(
            destination: DetailView2(imageName: message.pictureName)
          ) {
            Text(message.description)
          }
        }
      }.navigationBarTitle("图片列表")
    }
  }
}

struct DetailView2 : View {
  var imageName : String
  
  var body: some View{
    Image(imageName)
  }
}

struct PageNavigation_Previews: PreviewProvider {
  static var previews: some View {
    PageNavigation(messages: [
      InfoModel(
        description: "白马女人",
        pictureName: "Picture1"
      ),
      InfoModel(
        description: "长颈鹿🦒",
        pictureName: "Picture2"
      )
    ])
  }
}
