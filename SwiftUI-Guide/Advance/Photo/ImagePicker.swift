//
//  ImagePick.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/2/6.
//  Copyright © 2020 unrealce. All rights reserved.
//
// https://stackoverflow.com/questions/56515871/how-to-open-the-imagepicker-in-swiftui

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
  @Environment(\.presentationMode) var presentationMode
  @Binding var image: Image?

  class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @Binding var presentationMode: PresentationMode
    @Binding var image: Image?

    init(presentationMode: Binding<PresentationMode>, image: Binding<Image?>) {
      _presentationMode = presentationMode
      _image = image
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      let uiImage = info[.originalImage] as! UIImage
      image = Image(uiImage: uiImage)
      presentationMode.dismiss()
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
      presentationMode.dismiss()
    }
  }

  func makeCoordinator() -> Coordinator {
    Coordinator(presentationMode: presentationMode, image: $image)
  }

  func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
    let picker = UIImagePickerController()
    picker.delegate = context.coordinator
//    picker.allowsEditing = true
    picker.sourceType = .camera
    return picker
  }

  func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
  }
}
