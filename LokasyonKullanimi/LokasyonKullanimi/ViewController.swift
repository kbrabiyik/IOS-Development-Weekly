//
//  ViewController.swift
//  LokasyonKullanimi
//
//  Created by KUBRANIN MACİ on 8.05.2022.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var enlemLabel: UILabel!
    @IBOutlet weak var boylamLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        let konum = CLLocationCoordinate2D(latitude: 41.037231, longitude: 28.9839085) //haritanın merkezi
        let zoom = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        let bolge = MKCoordinateRegion(center: konum, span: zoom)
        mapView.setRegion(bolge, animated: true)
        
        let pin = MKPointAnnotation()
        pin.coordinate = konum
        pin.title = "Taksim"
        pin.subtitle = "Meydan"
        mapView.addAnnotation(pin)
    }
}

extension ViewController : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let konum = locations[locations.count-1]
        enlemLabel.text = "Enlem : \(konum.coordinate.latitude)"
        boylamLabel.text = "Enlem : \(konum.coordinate.longitude)"
    }
}
