//
//  MainMenuDentistView.swift
//  EasySmile
//
//  Created by Pedro Henrique on 31/07/23.
//

import UIKit

class MainMenuDentistView: UIView {

    lazy var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.image = UIImage(named: "backgroundImage")
        backgroundImage.contentMode = .scaleToFill
        
        return backgroundImage
    }()
    
    lazy var nameDentistLabel: UILabel = {
        let nameDentistLabel = UILabel()
        nameDentistLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return nameDentistLabel
    }()
    
    lazy var myProfile: UIButton = {
        let myProfile = UIButton()
        myProfile.translatesAutoresizingMaskIntoConstraints = false
        myProfile.setImage(UIImage(named: "iconePerfil"), for: .normal)
        
        return myProfile
    }()
    
    lazy var clientsList: UIButton = {
        let n = UIButton()
        n.translatesAutoresizingMaskIntoConstraints = false
        n.setImage(UIImage(named: "iconeLupa"), for: .normal)
        
        return n
    }()
    
    lazy var scheduling: UIButton = {
        let m = UIButton()
        m.translatesAutoresizingMaskIntoConstraints = false
        m.setImage(UIImage(named: "iconePerfil"), for: .normal)
        
        return m
    }()
    
    lazy var configScheduling: UIButton = {
        let p = UIButton()
        p.translatesAutoresizingMaskIntoConstraints = false
        p.setImage(UIImage(named: "iconeLupa"), for: .normal)
        
        return p
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElementsView()
        configConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElementsView() {
        self.addSubview(self.backgroundImage)
        self.addSubview(self.nameDentistLabel)
        self.addSubview(self.myProfile)
        self.addSubview(self.clientsList)
        self.addSubview(self.scheduling)
        self.addSubview(self.configScheduling)
    }
    
    private func configConstrains() {
        
        let guide = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
        
            self.backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.nameDentistLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 20),
            self.nameDentistLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20),
            self.nameDentistLabel.trailingAnchor.constraint(lessThanOrEqualTo: guide.trailingAnchor, constant: -293),
            
            self.myProfile.topAnchor.constraint(equalTo: nameDentistLabel.bottomAnchor, constant: 50),
            self.myProfile.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 30),
            self.myProfile.heightAnchor.constraint(equalToConstant: 125),
            self.myProfile.widthAnchor.constraint(greaterThanOrEqualToConstant: 120),
            
            self.clientsList.centerYAnchor.constraint(equalTo: myProfile.centerYAnchor),
            self.clientsList.leadingAnchor.constraint(lessThanOrEqualTo: myProfile.trailingAnchor, constant: 45),
            self.clientsList.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -45),
            self.clientsList.heightAnchor.constraint(equalToConstant: 125),
            self.clientsList.widthAnchor.constraint(greaterThanOrEqualToConstant: 120),
            
            self.scheduling.topAnchor.constraint(equalTo: myProfile.bottomAnchor, constant: 60),
            self.scheduling.centerXAnchor.constraint(equalTo: myProfile.centerXAnchor),
            self.scheduling.heightAnchor.constraint(equalToConstant: 125),
            self.scheduling.widthAnchor.constraint(greaterThanOrEqualToConstant: 120),
            
            self.configScheduling.centerYAnchor.constraint(equalTo: scheduling.centerYAnchor),
            self.configScheduling.leadingAnchor.constraint(lessThanOrEqualTo: scheduling.trailingAnchor, constant: 70),
            self.configScheduling.centerXAnchor.constraint(equalTo: clientsList.centerXAnchor),
            self.configScheduling.heightAnchor.constraint(equalToConstant: 125),
            self.configScheduling.widthAnchor.constraint(greaterThanOrEqualToConstant: 120)
        
        
        ])
    }
    
}
