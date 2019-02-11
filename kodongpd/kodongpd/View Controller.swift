//
//  ViewController.swift
//  kodongpd
import Foundation
import UIKit
import GoogleMaps
import CoreLocation
import AddressBookUI

class ViewController: UIViewController , GMSMapViewDelegate, CLLocationManagerDelegate {
    var store : Store?
    var location_name : String = "서울특별시 중구 필동 퇴계로 212"
    
    //위도와 경도 값을 초기화
  //  var address_latitude : CLLocationManagerDelegate = 0.0 as! CLLocationManagerDelegate
//    var address_longtitude : CLLocationManagerDelegate = 0.0 as! CLLocationManagerDelegate
    
    var original_latitude : CLLocationDegrees = 0.0
    var original_longtitude : CLLocationDegrees = 0.0
    
 //   var mapView: GMSMapView? = nil
   // var locationManager: CLLocationManager = CLLocationManager()
 //   @IBOutlet weak var location : UILabel!
  //  @IBOutlet weak var search : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
                
                
                let camera = GMSCameraPosition.camera(withLatitude: self.original_latitude as! CLLocationDegrees, longitude: self.original_longtitude as! CLLocationDegrees, zoom: 18)
                let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
                let position = CLLocationCoordinate2D(latitude: self.original_latitude, longitude: self.original_longtitude)
                let marker = GMSMarker(position: position)
                marker.title = "대한극장"
                self.view = mapView
                marker.map = mapView
            }
        })
        
        
        
      // let camera = GMSCameraPosition.camera(withTarget: store?.adr, zoom: 10)
        //let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
      //  let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
      //  view = mapView

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
