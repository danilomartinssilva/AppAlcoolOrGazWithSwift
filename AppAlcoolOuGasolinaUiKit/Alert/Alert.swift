//
//  Alert.swift
//  AppAlcoolOuGasolinaUiKit
//
//  Created by DANILO on 13/05/23.
//

import UIKit

class Alert: NSObject {

    let controller: UIViewController
        
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func showAlertInformation(title:String, message:String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style:.default)
        alertController.addAction(okButton)
        controller.present(alertController, animated: true)
        
    }
    
}
