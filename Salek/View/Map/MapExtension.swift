//
//  MapExtension.swift
//  PatientHistory
//
//  Created by Divo Ayman on 4/15/21.
//  Copyright © 2021 Divo Ayman. All rights reserved.
//

import Foundation
import UIKit
import MapKit
extension MapVC: CLLocationManagerDelegate {
        
    func fetchCityAndCountry(from location: CLLocation, completion: @escaping (_ city: String?, _ country:  String?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            completion(placemarks?.first?.subThoroughfare,
                       placemarks?.first?.thoroughfare,
                       error)
        }
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
    
}
extension MapVC: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let center = getCenterLocation(mapView: mapView)
        let geocoder = CLGeocoder()
        guard let previousLocation = self.previousLocation else {return}
        guard center.distance(from: previousLocation) > 50 else {return}
        self.previousLocation = center
        
        geocoder.reverseGeocodeLocation(center) {[weak self] (placemarks, error) in
            guard let self = self else {return}
            
            if let _  = error {
                return
            }
            
            guard let placemark = placemarks?.first else {
                
                return
            }
            let streetNumber = placemark.subThoroughfare
            
            let streetName = placemark.thoroughfare
            DispatchQueue.main.async {
                
                self.searchBar.text = "\(streetNumber ?? "") \(streetName ?? "")"
                self.addressLabel.text = "\(streetNumber ?? "") \(streetName ?? "")"
                
                print("$%^&*")
                print("\(streetNumber ?? "") \(streetName ?? "")")
            }
        }
        
    }
    
    
}

