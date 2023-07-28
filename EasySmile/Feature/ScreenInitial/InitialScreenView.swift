//
//  InitialScreenView.swift
//  EasySmile
//
//  Created by Pedro Henrique on 28/07/23.
//

import UIKit

class InitialScreenView: UIView {
    
    lazy var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.image = UIImage(named: "backgroundTelaLogin")
        backgroundImage.contentMode = .scaleAspectFit
        
        return backgroundImage
    }()
    
    lazy var imageIcon: UIImageView = {
        let imageIcon = UIImageView()
        imageIcon.translatesAutoresizingMaskIntoConstraints = false
        imageIcon.image = UIImage(named: "iconeEasySmile")
        imageIcon.contentMode = .scaleAspectFit
        
        return imageIcon
    }()
    
    lazy var easySmileLabel: UILabel = {
        let easySmileLabel = UILabel()
        easySmileLabel.translatesAutoresizingMaskIntoConstraints = false
        let labelText = "EasySmile"
        let attributedText = NSMutableAttributedString(string: labelText)
        attributedText.addAttributes([.font: UIFont(name: "Zapfino", size: 24) ?? UIFont.systemFont(ofSize: 24), .foregroundColor: UIColor.white], range: NSRange(location: 0, length: 3))
        attributedText.addAttributes([.font: UIFont(name: "American Typewriter Bold", size: 36) ?? UIFont.systemFont(ofSize: 36), .foregroundColor: UIColor.magenta], range: NSRange(location: 4, length: 8))
        easySmileLabel.attributedText = attributedText
        easySmileLabel.textAlignment = .center
        
        return easySmileLabel
    }()
    
    lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.backgroundColor = .purple
        loginButton.layer.cornerRadius = 10
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.titleLabel?.font = UIFont(name: "Arial Rounded MT Bold", size: 22)
        
        
        return loginButton
    }()
    
    lazy var registerButton: UIButton = {
        let registerButton = UIButton()
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.backgroundColor = .systemGray6
        registerButton.layer.cornerRadius = 10
        registerButton.setTitle("Registre-se", for: .normal)
        registerButton.setTitleColor(.black, for: .normal)
        registerButton.titleLabel?.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        
        return registerButton
    }()
    
    lazy var helpButton: UIButton = {
        let helpButton = UIButton()
        helpButton.translatesAutoresizingMaskIntoConstraints = false
        helpButton.setTitle("Precisa de Ajuda?", for: .normal)
        helpButton.setTitleColor(.darkGray, for: .normal)
        helpButton.titleLabel?.font = UIFont(name: "Al Nile", size: 16)
        
        return helpButton
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        
    private func addViews() {
        self.addSubview(self.backgroundImage)
        self.addSubview(self.imageIcon)
        self.addSubview(self.easySmileLabel)
        self.addSubview(self.loginButton)
        self.addSubview(self.registerButton)
        self.addSubview(self.helpButton)
        
    }
    
    private func configConstraints() {
        
        let guide = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            self.backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        
            self.imageIcon.topAnchor.constraint(equalTo: guide.topAnchor, constant: 70),
            self.imageIcon.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.imageIcon.heightAnchor.constraint(equalToConstant: 170),
            self.imageIcon.widthAnchor.constraint(equalToConstant: 170),
            
            self.easySmileLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.easySmileLabel.topAnchor.constraint(equalTo: imageIcon.bottomAnchor, constant: 25),
            
            self.loginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.loginButton.topAnchor.constraint(equalTo: easySmileLabel.bottomAnchor, constant: 70),
            self.loginButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 250),
            
            self.registerButton.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor, constant: 55),
            self.registerButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.registerButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 200),
            
            self.helpButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.helpButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: 30),
            helpButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 130),
            helpButton.topAnchor.constraint(greaterThanOrEqualTo: self.registerButton.bottomAnchor, constant: 55)
            
        
        
        ])
    }
    
}
