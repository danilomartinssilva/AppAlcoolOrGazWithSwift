//
//  CalculatorVC.swift
//  AppAlcoolOuGasolinaUiKit
//
//  Created by DANILO on 22/04/23.
//

import UIKit

class CalculatorVC: UIViewController {

    var screen: CalculatorScreen?
    var alert: Alert?
    
    override func loadView(){
        screen = CalculatorScreen()
        view = screen
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        alert = Alert(controller: self)
        screen?.delegate(delegate: self)
    }
    
    func validateTextField()->Bool{
        guard let ethanolPrice = screen?.ethanolPriceTextField.text else {return false}
        guard let gasPrice = screen?.gaslPriceTextField.text else {return false}
        
        if ethanolPrice.isEmpty || gasPrice.isEmpty{
            alert?.showAlertInformation(title: "Atenção!", message: "Informe os valores do álcool e gasolina!")
            return false
        }
        return true
    }

}

extension CalculatorVC: CalculatorScreenDelegate {
    func tappedCalculateButton() {
        if validateTextField(){
            let formatter = NumberFormatter()
             formatter.numberStyle = .decimal
             
             let ethanolPrice:Double = (formatter.number(from: screen?.ethanolPriceTextField.text ?? "0.0") as? Double) ?? 0.0
             let gasPrice:Double = (formatter.number(from: screen?.gaslPriceTextField.text ?? "0.0") as? Double) ?? 0.0
            
            var vc:ResultViewController?
      
               
                        
             if ethanolPrice/gasPrice > 0.7 {
                 vc = ResultViewController(bestFuel: .gas)
          
             }
             else {
                 vc = ResultViewController(bestFuel: .ethanol)
          
             }
            navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
        }

        
    
    }
    
    func tappedBackButton() {
        navigationController?.popViewController(animated: true)

    }
    
    
}
