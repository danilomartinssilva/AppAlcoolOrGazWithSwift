//
//  ResultViewController.swift
//  AppAlcoolOuGasolinaUiKit
//
//  Created by DANILO on 13/05/23.
//

import UIKit

enum BestFuel: String{
    case gas = "Gasolina"
    case ethanol = "Àlcool"
}

class ResultViewController: UIViewController {
       
    
    var screen: ResultScreen?
    var bestFuel: BestFuel
    
    init(bestFuel:BestFuel){
        self.bestFuel = bestFuel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView (){
        screen = ResultScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        screen?.resultLabel.text = bestFuel.rawValue
        
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

    func popViewController(){
        navigationController?.popViewController(animated: true)
    }


    
}

extension ResultViewController: ResultScreenDelegate{
    func tappedBackButtonToCalculateScreen() {
        popViewController()
    }
    
    func tappedCalculateButton() {
        popViewController()
    }
    
    
}
