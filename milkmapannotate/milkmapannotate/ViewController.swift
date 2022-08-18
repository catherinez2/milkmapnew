//
//  ViewController.swift
//  milkmapannotate
//
//  Created by Scholar on 8/17/22.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapKit: MKMapView!
    
    let map = MKMapView()
    let coordinate = CLLocationCoordinate2D(latitude: 40.670000, longitude: -73.913990)
    let coordinate1 = CLLocationCoordinate2D(latitude: 40.836360, longitude: -73.920360)
    let coordinate2 = CLLocationCoordinate2D(latitude: 40.673950, longitude: -73.973020)
    let coordinate3 = CLLocationCoordinate2D(latitude: 40.702240, longitude: -73.817630)
    let coordinate4 = CLLocationCoordinate2D(latitude: 40.739370, longitude: -73.700250)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(map)
        map.frame = view.bounds
        
        map.setRegion(MKCoordinateRegion(center: coordinate,
                                         span: MKCoordinateSpan(latitudeDelta: 0.1,
                                                                longitudeDelta: 0.1
                            )
                    ),
                      animated: false)
        map.delegate = self
        
        addCustomPin()
        addCustomPin1()
        addCustomPin2()
        addCustomPin3()
        addCustomPin4()
        
    }

    
    private func addCustomPin() {
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        pin.title = "Brownsville Breast Milk Depot"
        pin.subtitle = "Donate your breast milk today!"
        map.addAnnotation(pin)
    }
    
    private func addCustomPin1() {
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate1
        pin.title = "Gotham Morrisania WIC (Opening Soon)"
        pin.subtitle = "Donate your breast milk today!"
        map.addAnnotation(pin)
    }
    
    private func addCustomPin2() {
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate2
        pin.title = "Allied Pediatrics of Cobble Hill"
        pin.subtitle = "Donate your breast milk today!"
        map.addAnnotation(pin)
    }
    
    private func addCustomPin3() {
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate3
        pin.title = "Jamaica Hospital WIC Office"
        pin.subtitle = "Donate your breast milk today!"
        map.addAnnotation(pin)
    }

    private func addCustomPin4() {
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate4
        pin.title = "Macaluso Medical"
        pin.subtitle = "Donate your breast milk today!"
        map.addAnnotation(pin)
    }
    
    // Map
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        
        var annotationView = map.dequeueReusableAnnotationView(withIdentifier: "custom")
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom")
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }
    
        annotationView?.image = UIImage(named: "bottle")
//        annotationView?.rightCalloutAccessoryView = UIButton(type: )
        
        let btn = UIButton(type: .detailDisclosure)
        annotationView!.rightCalloutAccessoryView = btn
                    return annotationView
        }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        map.frame = CGRect(x: 0, y: view.safeAreaInsets.top,
                    width: view.frame.size.width, height: view.frame.size.width - view.safeAreaInsets.top)
    }
    
}




