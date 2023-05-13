//
//  HomeVC.swift
//  AppAlcoolOuGasolinaUiKit
//
//  Created by DANILO on 22/04/23.
//

import UIKit

class HomeVC: UIViewController {
    
    var screen: HomeScreen?
    
    override func loadView(){
        screen = HomeScreen()
        view = screen
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        screen?.delegate(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }


}

extension HomeVC: HomeScreenDelegate {
    func tappedStartButton() {
       let vc = CalculatorVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
}
