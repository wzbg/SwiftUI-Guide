//
//  MapView.swift
//  SwiftUI-Guide
//
//  Created by unrealce on 2019/12/31.
//  Copyright © 2019 unrealce. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
  func makeUIView(context: Context) -> MKMapView {
    MKMapView()
  }
  
  func updateUIView(_ uiView: MKMapView, context: Context) {
    uiView.showsUserLocation = true
    uiView.mapType = .hybrid
    let coordinate2D = CLLocationCoordinate2D(
      latitude: 31.233462, longitude: 121.492156
    )
    let zoomLevel = 0.05
    let region = MKCoordinateRegion(
      center: coordinate2D,
      span: MKCoordinateSpan(
        latitudeDelta: zoomLevel,
        longitudeDelta: zoomLevel
      )
    )
    uiView.setRegion(uiView.regionThatFits(region), animated: true)
  }
}

struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView()
  }
}
