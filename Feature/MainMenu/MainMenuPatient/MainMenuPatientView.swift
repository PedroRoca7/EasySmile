//
//  MainMenuPatientView.swift
//  EasySmile
//
//  Created by Pedro Henrique on 28/07/23.
//

import UIKit

class MainMenuPatientView: UIView {
    
    lazy var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.image = UIImage(named: "backgroundImage")
        backgroundImage.contentMode = .scaleToFill
        
       return backgroundImage
    }()
    
    lazy var namePatientLabel: UILabel = {
        let namePatientLabel = UILabel()
        namePatientLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return namePatientLabel
    }()
    
    lazy var myProfileButton: UIButton = {
        let myProfileButton = UIButton()
        myProfileButton.translatesAutoresizingMaskIntoConstraints = false
        myProfileButton.setImage(UIImage(named: "iconePerfil"), for: .normal)
        
        return myProfileButton
        
    }()
    
    lazy var searchDentistButton: UIButton = {
        let searchDentisButton = UIButton()
        searchDentisButton.translatesAutoresizingMaskIntoConstraints = false
        searchDentisButton.setImage(UIImage(named: "iconeLupa"), for: .normal)
        
        return searchDentisButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElementsView()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElementsView() {
        self.addSubview(self.backgroundImage)
        self.addSubview(self.namePatientLabel)
        self.addSubview(self.myProfileButton)
        self.addSubview(self.searchDentistButton)
        
    }
    
    private func configConstraints() {
        
        let guide = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
        
            self.backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.namePatientLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 50),
            self.namePatientLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 30),
            self.namePatientLabel.trailingAnchor.constraint(greaterThanOrEqualTo: guide.trailingAnchor, constant: -293),
            
            self.myProfileButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.myProfileButton.topAnchor.constraint(equalTo: self.namePatientLabel.bottomAnchor, constant: 130),
            self.myProfileButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 35),
            self.myProfileButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 120),
            self.myProfileButton.heightAnchor.constraint(equalToConstant: 125),
            
            self.searchDentistButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.searchDentistButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -35),
            self.searchDentistButton.leadingAnchor.constraint(greaterThanOrEqualTo: self.myProfileButton.trailingAnchor, constant: 30),
            self.searchDentistButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 120),
            self.searchDentistButton.heightAnchor.constraint(equalToConstant: 125)
        ])
    }
    
}
