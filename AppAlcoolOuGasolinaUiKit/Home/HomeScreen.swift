//
//  HomeScreen.swift
//  AppAlcoolOuGasolinaUiKit
//
//  Created by DANILO on 22/04/23.
//

import UIKit

protocol HomeScreenDelegate: AnyObject {
    func tappedStartButton()
}

class HomeScreen: UIView {
    
    private weak var delegate: HomeScreenDelegate?
    
    
    public func delegate(delegate: HomeScreenDelegate?){
        self.delegate = delegate;
    }
    
    lazy var backgroundImageView: UIImageView = {
    
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named:"BG HOME")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var logoAppImageView: UIImageView = {
        let image = UIImageView();
        image.image =  UIImage(named: "LOGO.png")
        image.translatesAutoresizingMaskIntoConstraints=false;
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false;
        button.setTitle("Começar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16,weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true;
        button.layer.cornerRadius = 8;
        button.backgroundColor = UIColor(red: 230/255, green: 0/255, blue: 127/255, alpha: 1.0)
        button.addTarget(self, action: #selector(tappedStartButton), for: .touchUpInside)

        return button
    }()
    
    override init(frame:CGRect){
        super.init(frame: frame)
        addSubview(backgroundImageView)
        addSubview(logoAppImageView)
        addSubview(startButton)
        configContraints()  
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tappedStartButton() {
        delegate?.tappedStartButton()
        
    }
    
    private func configContraints(){
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            logoAppImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 104),
            logoAppImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 20),
            logoAppImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,constant: -20),
            
            startButton.bottomAnchor.constraint(equalTo:safeAreaLayoutGuide.bottomAnchor, constant: -125 ),
            startButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant:60),
            startButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -60),
            startButton.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
    
    

}
