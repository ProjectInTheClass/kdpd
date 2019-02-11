
import Foundation
import UIKit
import GoogleMaps
import CoreLocation
import AddressBookUI

class MapViewController: UIViewController , GMSMapViewDelegate, CLLocationManagerDelegate {
    @IBOutlet weak var barButton: UIBarButtonItem!
    var location_name : String = ""
    let d = "서울특별시"
    
    //@IBOutlet weak var mapViewLoad : UIView!
    var original_latitude : CLLocationDegrees = 0.0
    var original_longtitude : CLLocationDegrees = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    location_name = d
        + location_name
        GMSServices.provideAPIKey("AIzaSyAfLzLFmrAbPi35kMKIyYGttdTRhWqvNeA")
        
        CLGeocoder().geocodeAddressString(location_name, completionHandler: {(placemarks, error) in
            if error != nil{
                print(error)
                return
            }
            if (placemarks?.count)! > 0{
                let placemark = placemarks?[0]
                let location = placemark?.location
                let coordinate = location?.coordinate
                print(coordinate?.latitude)
                print(coordinate?.longitude)
                self.original_latitude = coordinate!.latitude
                self.original_longtitude = coordinate!.longitude
                
                
                let camera = GMSCameraPosition.camera(withLatitude: self.original_latitude as! CLLocationDegrees, longitude: self.original_longtitude as! CLLocationDegrees, zoom: 17)
                let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
                let position = CLLocationCoordinate2D(latitude: self.original_latitude, longitude: self.original_longtitude)
                let marker = GMSMarker(position: position)
                marker.title = "대한극장"
                marker.map = mapView
                self.view = mapView
                
            }
        })

    }
    @IBAction func modalDismiss(){
        self.dismiss(animated: true, completion: {
        })
    }
}


