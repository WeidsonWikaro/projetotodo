//
//  InsertAlunoViewController.swift
//  ProjectFinal
//
//  Created by Anderson Carlos Nunes on 13/01/2019.
//  Copyright © 2019 Anderson Carlos Nunes Sales. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class InsertAlunoViewController: UIViewController {

    @IBOutlet weak var mapKit: MKMapView!
    @IBOutlet weak var nomeAlunoLabel: UITextField!
    
    var alunoModel: AlunoModel!
    var listItems:Array<Aluno> = []
    var indexSelected = -1
    var textSelected: String?
    
    let locationManager = CLLocationManager()
    var latitude = "0"
    var longitude = "0"
    var latitudeTouch = "0"
    var longitudeTouch = "0"
    var isTouch  = false
    var object: Aluno?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.alunoModel = AlunoModel()
        self.listItems = alunoModel.ListarAluno()
        if(indexSelected != -1){
            
            object =  listItems[indexSelected]
        }

        map()
        // Do any additional setup after loading the view.
    }
    
    
    
    private func map(){
        locationManager.delegate = self
        mapKit.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        
        locationManager.requestWhenInUseAuthorization()
        
   
       
        inserirMarcador()
        
       
        //locationManager.startUpdatingLocation()
        mapKit.showsUserLocation = true
    }
    
    private func atualizarCentralizarCoordenadas(coordinates: CLLocationCoordinate2D) {
        let region = MKCoordinateRegion(center: coordinates, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapKit.setRegion(region, animated: true)
    }
    
    
    private func inserirMarcador(){
        // adding a annotation
  let point = MKPointAnnotation()
         if indexSelected != -1 {
            if let objectAluno = object{
                let item = objectAluno
                point.title = item.studentDescription
                
                point.coordinate = CLLocationCoordinate2D(latitude: item.latitude ?? 0, longitude: item.longitude ?? 0)
                
                atualizarCentralizarCoordenadas(coordinates: point.coordinate)
               
                
            }
            
         }else {
            if let coordinates = locationManager.location?.coordinate {
                atualizarCentralizarCoordenadas(coordinates: coordinates)
            }
             locationManager.startUpdatingLocation()
        }
         mapKit.addAnnotation(point)
        
        
    }
    
   /* override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Let's put in a log statement to see the order of events
        print(#function)
        
        for touch in touches {
            let touchPoint = touch.location(in: self.mapKit)
            let location = self.mapKit.convert(touchPoint, toCoordinateFrom: self.mapKit)
            self.latitudeTouch = String(location.latitude)
            self.longitudeTouch = String(location.longitude)
            self.isTouch = true
            //map()
            
            //print ("\(location.latitude), \(location.longitude)")
        }
    }*/
    
    
    override func viewWillAppear(_ animated: Bool) {
        if(indexSelected != -1){
            if let aluno = object{
                
                nomeAlunoLabel.text = aluno.studentDescription
                textSelected = nomeAlunoLabel.text
            }
            
        }
    }
    
    
    @IBAction func inserirAluno(_ sender: UIButton) {
        
        inserirMarcador()
        let latitude = mapKit.centerCoordinate.latitude
        let longitude = mapKit.centerCoordinate.longitude
        
        if let alunoDescription = nomeAlunoLabel.text{
             if let textoSelect = textSelected{
                
                var aluno = Aluno(description: alunoDescription, latitude: latitude, longitude: longitude)
                alunoModel.update(aluno, indexSelected ?? 0)
                self.navigationController?.popViewController(animated: true)
             }
             else{
                
                var aluno = Aluno(description: alunoDescription, latitude: latitude, longitude: longitude)
                alunoModel.inserirAluno(aluno)
                self.navigationController?.popViewController(animated: true)
            }
        }
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


extension InsertAlunoViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // update the location here
        if let coordinate = locations.last {
            let region = MKCoordinateRegion(center: coordinate.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
            mapKit.setRegion(region, animated: true)
           /* if(isTouch){
                self.latitude = String(mapKit.userLocation.coordinate.latitude)
                self.longitude = String(mapKit.userLocation.coordinate.longitude)
            }else{
                self.latitude = self.latitudeTouch
                self.longitude = self.longitudeTouch
            }*/
            self.latitude = String(mapKit.userLocation.coordinate.latitude)
            self.longitude = String(mapKit.userLocation.coordinate.longitude)
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // update the authorization here
    }
}

extension String {
    var doubleValue: Double {
        return (self as NSString).doubleValue
    }
}

extension InsertAlunoViewController: MKMapViewDelegate {}
