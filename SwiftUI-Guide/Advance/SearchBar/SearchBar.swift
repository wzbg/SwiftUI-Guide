//
//  SearchBar.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/2/16.
//  Copyright © 2020 unrealce. All rights reserved.
//

import SwiftUI

struct SearchBar: UIViewRepresentable {
  @Binding var text: String
  var placeholder: String?
  
  class Coordinator: NSObject, UISearchBarDelegate {
    @Binding var text: String
    
    init(text: Binding<String>) {
      _text = text
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
      text = searchText
    }
  }
  
  func makeCoordinator() -> SearchBar.Coordinator {
    Coordinator(text: $text)
  }
  
  func makeUIView(context: Context) -> UISearchBar {
    let searchBar = UISearchBar()
    searchBar.delegate = context.coordinator
    searchBar.placeholder = placeholder
    return searchBar
  }
  
  func updateUIView(_ uiView: UISearchBar, context: Context) {
    uiView.text = text
  }
}
