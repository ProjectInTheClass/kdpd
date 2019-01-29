//
//  ViewController.swift
//  kodongpd
//
//  Created by 오세훈 on 30/01/2019.
//  Copyright © 2019 dgulinc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MTMapViewDelegate {
lazy var mapView: MTMapView = MTMapView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.daumMapApiKey = "3aed8e79d8f9885c499e11ec1de60002"
        mapView.delegate = self
        mapView.baseMapType = .standard
        self.view.addSubview(mapView)
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
