//
//  UIViewController + Extension.swift
//  AppAlcoolOuGasolinaUiKit
//
//  Created by DANILO on 13/05/23.
//

import Foundation
import UIKit

extension UIViewController{
    
    func hideKeyboardWhenTappedAround(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard(){
        view.endEditing(true)
    }
}
