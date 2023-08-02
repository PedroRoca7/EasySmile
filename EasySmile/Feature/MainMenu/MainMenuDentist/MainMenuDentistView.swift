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
        backgroundImage.image = UIImage(named: "backgroundTelaLogin")
        backgroundImage.contentMode = .scaleAspectFill
        
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
        
        return myProfile
    }()
    
    lazy var n: UIButton = {
        let n = UIButton()
        n.translatesAutoresizingMaskIntoConstraints = false
        
        return n
    }()
    
    lazy var m: UIButton = {
        let m = UIButton()
        m.translatesAutoresizingMaskIntoConstraints = false
        
        return m
    }()
    
    lazy var p: UIButton = {
        let p = UIButton()
        p.translatesAutoresizingMaskIntoConstraints = false
        
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
        self.addSubview(self.n)
        self.addSubview(self.m)
        self.addSubview(self.p)
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
            
            self.n.centerYAnchor.constraint(equalTo: myProfile.centerYAnchor),
            self.n.leadingAnchor.constraint(lessThanOrEqualTo: self.myProfile.trailingAnchor, constant: 45),
            self.n.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -30),
            self.n.heightAnchor.constraint(equalToConstant: 125),
            self.n.widthAnchor.constraint(greaterThanOrEqualToConstant: 120),
            
            self.m.topAnchor.constraint(equalTo: myProfile.bottomAnchor, constant: 60),
            self.m.leadingAnchor.constraint(equalTo: myProfile.leadingAnchor),
            self.m.heightAnchor.constraint(equalToConstant: 125),
            self.m.widthAnchor.constraint(greaterThanOrEqualToConstant: 120),
            
            self.p.centerYAnchor.constraint(equalTo: m.centerYAnchor),
            self.p.leadingAnchor.constraint(lessThanOrEqualTo: self.m.trailingAnchor, constant: 45),
            self.p.trailingAnchor.constraint(equalTo: n.trailingAnchor),
            self.p.heightAnchor.constraint(equalToConstant: 125),
            self.p.widthAnchor.constraint(greaterThanOrEqualToConstant: 120)
        
        
        ])
    }
    
}
