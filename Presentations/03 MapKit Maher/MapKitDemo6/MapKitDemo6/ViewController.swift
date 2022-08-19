//
//  ViewController.swift
//  MapKitDemo6
//
//  Created by Maher Damouni on 8/18/22.
//

import MapKit
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        checkLocationServices()
    }
    
    func checkLocationServices() {
        
        if CLLocationManager.locationServicesEnabled() {
            
            setUpLocationManager()
            checkAuth()
        } else {
            // let the user know to change location settings in settings
        }
    }
    
    func setUpLocationManager() {
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkAuth() {
        
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            centerView()
            locationManager.startUpdatingLocation()
            addAnnotations()
            mapView.addOverlays(self.parseGeoJson())
        default: break
        }
    }
    
    func centerView() {
        
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion(center: location, latitudinalMeters: 100000, longitudinalMeters: 100000)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func addAnnotations() {
        
        let mahersHomeTown = MKPointAnnotation()
        mahersHomeTown.title = "Maher's HomeTown"
        mahersHomeTown.coordinate = CLLocationCoordinate2D(latitude: 34.1397292, longitude: -118.03534489999998)
        mapView.addAnnotation(mahersHomeTown)
    }
    
    func parseGeoJson() -> [MKOverlay] {
        
        guard let url = Bundle.main.url(forResource: "map", withExtension: "json") else {
            fatalError("could not get url")
        }
        
        var geoJson = [MKGeoJSONObject]()
        
        do {
            let data = try Data(contentsOf: url)
            geoJson = try MKGeoJSONDecoder().decode(data)
        } catch {
            print("error decoding geojson")
        }
        
        var overlays = [MKOverlay]()
        
        for item in geoJson {
            if let feature = item as? MKGeoJSONFeature {
                for geo in feature.geometry {
                    if let polygon = geo as? MKPolygon {
                        overlays.append(polygon)
                    }
                }
            }
        }
        
        return overlays
    }
}

extension ViewController: CLLocationManagerDelegate, MKMapViewDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationServices()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //        print(locations.count)
        centerView()
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
         if let polygon = overlay as? MKPolygon {
             let renderer = MKPolygonRenderer(polygon: polygon)
             renderer.fillColor = UIColor.red.withAlphaComponent(0.5)
             renderer.strokeColor = UIColor.black
             return renderer
         }
 
         return MKOverlayRenderer()
     }
}

// code below should add a custom image to an annotation.. doesnt work.. needs editing

//func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//    guard annotation is MKPointAnnotation else { return nil }
//
//    let identifier = "Annotation"
//    var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
//
//    if annotationView == nil {
//        annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
//        annotationView?.image = UIImage(systemName: "house")
//        annotationView!.canShowCallout = true
//    } else {
//        annotationView!.annotation = annotation
//    }
//
//    return annotationView
//}
