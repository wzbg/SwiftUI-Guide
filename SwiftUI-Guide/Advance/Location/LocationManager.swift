//
//  LocationManager.swift
//  SwiftUI-Guide
//
//  Created by huanbing on 2020/2/6.
//  Copyright © 2020 unrealce. All rights reserved.
//

import Combine
import CoreLocation

class LocationManager: NSObject, ObservableObject {
  private let geocoder = CLGeocoder()
  private let locationManager = CLLocationManager()
  let objectWillChange = PassthroughSubject<Void, Never>()
  
  @Published var status: CLAuthorizationStatus? {
    willSet { objectWillChange.send() }
  }
  
  @Published var location: CLLocation? {
    willSet { objectWillChange.send() }
  }
  
  @Published var placemark: CLPlacemark? {
    willSet { objectWillChange.send() }
  }
  
  override init() {
    super.init()
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestWhenInUseAuthorization()
    locationManager.startUpdatingLocation()
  }
  
  private func geocode() {
    guard let location = self.location else { return }
    geocoder.reverseGeocodeLocation(location) { places, error in
      guard let places = places, error == nil else { return }
      self.placemark = places.last
    }
  }
}

extension LocationManager: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    self.status = status
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.last else { return }
    self.location = location
    self.geocode()
  }
}

extension CLLocation {
  var latitude: Double { coordinate.latitude }
  var longitude: Double { coordinate.longitude }
}
