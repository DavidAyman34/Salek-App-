//
//  MapVC.swift
//  PatientHistory
//
//  Created by Divo Ayman on 4/15/21.
//  Copyright © 2021 Divo Ayman. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

// MARK:- Protocols
protocol sendingAddress {
    func send(address: String)
}

class MapVC: UIViewController, UISearchBarDelegate, UIGestureRecognizerDelegate {
    
    // MARK:- Outlets
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var currentLocationBtn: UIButton!
    
    // MARK: - Properties
    var delegate: sendingAddress?
    let locationManager = CLLocationManager()
    var previousLocation: CLLocation?
    var homeCareSpeciality = ""
    
    // MARK:- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateView()
    }
    
    // MARK: -  Methods
     func updateView(){
        mapView.delegate = self
        searchBar.delegate = self
        checkLocationService()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        let latitude = mapView.centerCoordinate.latitude
        let longtiude = mapView.centerCoordinate.longitude
        let location = CLLocation(latitude: latitude, longitude: longtiude)
        location.fetchCityAndCountry { city, country, error in
            guard let city = city, let country = country, error == nil else { return }
            print(city + ", " + country)
            
            let center = self.getCenterLocation(mapView: self.mapView)
            let geocoder = CLGeocoder()
            
            
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
     func updateUI(){
        saveButton.titleLabel?.font = FontFamily.Nunito.bold.font(size: 20)
        saveButton.layer.cornerRadius = 15
        currentLocationBtn.layer.cornerRadius = currentLocationBtn.frame.size.width/2
        currentLocationBtn.layer.masksToBounds = true
        currentLocationBtn.backgroundColor = .white
    }
    
    
     func setupLocationManger(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        
        
    }
    
     func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location , latitudinalMeters: 10000, longitudinalMeters: 10000)
            mapView.setRegion(region, animated: true)
        }
    }
    
     func checkLocationAuthorization() {
        
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            // once we have authorization
            startTrackingUserLocation()
        case .denied:
            showAlert(title: "Location Services disabled", massage: "Please enable Location Services in Settings", present: self, titleBtn: "OK") {
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
            }
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .authorizedAlways:
            break
        @unknown default:
            break
        }
        
    }
    
     func startTrackingUserLocation() {
        mapView.showsUserLocation = true
        centerViewOnUserLocation()
        locationManager.startUpdatingLocation()
        previousLocation = getCenterLocation(mapView: mapView)
    }
    
     func checkLocationService() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManger()
            checkLocationAuthorization()
        }
        else {
            print("errorSERVICE")
        }
        
    }
    
    func getCenterLocation(mapView: MKMapView) -> CLLocation {
        
        let latitude = mapView.centerCoordinate.latitude
        let longtiude = mapView.centerCoordinate.longitude
        
        let coordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longtiude)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        self.mapView.setRegion(region, animated: true)
        
        return CLLocation(latitude: latitude, longitude: longtiude)
        
    }
    
    // MARK:- Button Methods
    @IBAction func saveAddressButton(_ sender: Any) {
        if searchBar.text?.isEmpty == true {
            showAlert(title: "error", massage: "select Your Location", present: self, titleBtn: "ok")
            
        }
        else {
            self.delegate?.send(address: searchBar.text ?? "eslam")
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func currentLocationTapped(_ sender: UIButton) {
        
        checkLocationService()
    }
    
    // MARK: - Public Methods
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        UIApplication.shared.beginIgnoringInteractionEvents()
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = .gray
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        self.view.addSubview(activityIndicator)
        searchBar.resignFirstResponder()
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = searchBar.text
        let activeSearch = MKLocalSearch(request: searchRequest)
        
        activeSearch.start { (response, err) in
            
            activityIndicator.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
            
            if response == nil {
                self.showAlert(title: "error", massage: "No Result Found", present: self, titleBtn: "OK")
                print("ERROR")
            }
            else {
                let annotations = self.mapView.annotations
                self.mapView.removeAnnotations(annotations)
                
                let latitude = response?.boundingRegion.center.latitude
                let longitude = response?.boundingRegion.center.longitude
                let coordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude!, longitude!)
                let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                let region = MKCoordinateRegion(center: coordinate, span: span)
                self.mapView.setRegion(region, animated: true)
                
            }
        }
    }
    
    
    // MARK:- Public Methods
    class func create() -> MapVC {
        let mapVC: MapVC = UIViewController.create(storyboardName: Storyboards.map, identifier: ViewControllers.mapVC)
        
        return mapVC
    }
    
}
// MARK: - Extension
extension CLLocation {
    func fetchCityAndCountry(completion: @escaping (_ city: String?, _ country:  String?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(self) { completion($0?.first?.locality, $0?.first?.country, $1) }
    }
}


