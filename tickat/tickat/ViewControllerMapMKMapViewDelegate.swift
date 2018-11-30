//
//  ViewControllerMapMKMapViewDelegate.swift
//  tickat
//
//  Created by Lucas Cardoso on 22/11/18.
//  Copyright © 2018 Paula Vaz. All rights reserved.
//

import MapKit

extension ViewControllerMap: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView){
        var selectedLocation:Location? = nil
        
        for i in AppData.shared.allLocations{
            if i.title == view.annotation?.title{
                selectedLocation = i
            }
        }
        
        if ((selectedLocation?.isBlocked) ?? true){
            self.openPopUp(popUp: self.popUpCallToAction)
        } else {
            self.tabBarController?.selectedIndex = 1
        }
    }
    
//        Teste de Conectividade com o Watch 
//    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
//        var selectedLocation:Location? = nil
//
//        for i in AppData.shared.allLocations{
//            if i.title == view.annotation?.title{
//                selectedLocation = i
//            }
//        }
//
//        let selectedCuriosity = selectedLocation?.curiosity
//
//        if let curiosity = selectedCuriosity{
//            sendInformationToWatch(curiosity: curiosity)
//        } else {
//            print("Error, not a curiosity")
//        }
//    }
    
    func openPopUp(popUp: UIView) {
        popUp.layer.cornerRadius = 20
        popUp.layer.masksToBounds = true
        
        popUp.center = self.view.center
        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        if !UIAccessibility.isReduceTransparencyEnabled {
            view.backgroundColor = .clear
            
            blurEffectView.frame = self.view.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            view.insertSubview(blurEffectView, at: 1)
        } else {
            view.backgroundColor = .black
        }
        
        view.insertSubview(popUp, at: 2)
        
        popUp.transform = CGAffineTransform(scaleX: 0, y: 0)
        blurEffectView.transform = CGAffineTransform(scaleX: 0, y: 0)
        
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: {
            popUp.alpha = 1.0;
            blurEffectView.alpha = 1.0;
            popUp.transform = .identity
            blurEffectView.transform = .identity
        }, completion: nil)
    }

}
