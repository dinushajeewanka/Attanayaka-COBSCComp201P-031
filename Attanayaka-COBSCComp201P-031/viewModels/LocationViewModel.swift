//
//  LocationViewModel.swift
//  Attanayaka-COBSCComp201P-031
//
//  Created by Dinusha on 2021-12-15.
//

import Foundation
import CoreLocation
import Combine



class LocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    @Published var locationStatus: CLAuthorizationStatus?
    @Published var lastLocation: CLLocation?
    @Published var locationAcess: Bool = false

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    var statusString: String {
        guard let status = locationStatus else {
            return "User Location is Not intilized"
        }
        
        switch status {
        case .notDetermined: return "User is Not Determined"
        case .authorizedWhenInUse: return "User has give acess for authorizedWhenInUse"
        case .authorizedAlways: return "User has give acess for authorizedAlways"
        case .restricted: return "User is restricted location permision"
        case .denied: return "User is denied"
        default: return "User Location is Not intilized"
        }
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        locationStatus = status
        print(#function, statusString)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        lastLocation = location
        print(#function, location)
    }
    func checkLocationDistance() -> Double {
        let coordinate₀ = CLLocation(latitude: 6.9061415, longitude: 79.8709245)
        let coordinate₁ = CLLocation(latitude: lastLocation?.coordinate.latitude ?? 6.9061415, longitude: lastLocation?.coordinate.longitude ?? 79.8709245)
        let differenRange = coordinate₀.distance(from: coordinate₁)
        return differenRange
    }
}

