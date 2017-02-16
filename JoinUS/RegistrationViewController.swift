import UIKit
import MapKit
import CoreLocation

class RegistrationViewController: UIViewController, CLLocationManagerDelegate {
    
    

    @IBOutlet weak var Map: MKMapView!
    
    let maneger = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01 , 0.01)
        
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        Map.setRegion(region, animated: true)
        
        
        self.Map.showsUserLocation = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        maneger.delegate = self
        maneger.desiredAccuracy = kCLLocationAccuracyBest
        maneger.requestAlwaysAuthorization()
        maneger.startUpdatingLocation()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}

