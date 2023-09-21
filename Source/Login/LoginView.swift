//
//  LoginView.swift
//  EasySmile
//
//  Created by Pedro Henrique on 31/07/23.
//

import UIKit

class LoginView: UIView {
    
    lazy var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.image = UIImage(named: "backgroundImage")
        backgroundImage.contentMode = .scaleToFill
        
        return backgroundImage
    }()
    
    lazy var emailLabel: UILabel = {
        let emailLabel = UILabel()
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.text = "Email:"
        emailLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 22)
        
        return emailLabel
    }()
    
    lazy var emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.keyboardType = .emailAddress
        emailTextField.borderStyle = .roundedRect
        emailTextField.font = UIFont.systemFont(ofSize: 22)
        emailTextField.placeholder = "Digite seu Email:"
        
        return emailTextField
    }()
    
    lazy var passwordLabel: UILabel = {
        let senhaLabel = UILabel()
        senhaLabel.translatesAutoresizingMaskIntoConstraints = false
        senhaLabel.text = "Senha:"
        senhaLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 22)
        
        return senhaLabel
    }()
    
    lazy var passwordTextField: UITextField = {
        let senhaTextField = UITextField()
        senhaTextField.translatesAutoresizingMaskIntoConstraints = false
        senhaTextField.borderStyle = .roundedRect
        senhaTextField.font = UIFont.systemFont(ofSize: 22)
        senhaTextField.placeholder = "Digite sua Senha:"
        senhaTextField.isSecureTextEntry = true
        
        return senhaTextField
    }()
    
    lazy var forgotPasswordButton: UIButton = {
        let forgotPasswordButton = UIButton()
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.setTitle("Esqueceu sua senha?", for: .normal)
        forgotPasswordButton.setTitleColor(.magenta, for: .normal)
        forgotPasswordButton.titleLabel?.font = UIFont(name: "Arial Negrito", size: 16)
        
        return forgotPasswordButton
    }()
    
    lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = .magenta
        loginButton.titleLabel?.font = UIFont(name: "Arial Rounded MT Bold", size: 22)
        loginButton.layer.cornerRadius = 10
        
        return loginButton
    }()
    
    lazy var needHelpButton: UIButton = {
        let needHelpButton = UIButton()
        needHelpButton.translatesAutoresizingMaskIntoConstraints = false
        needHelpButton.setTitle("Precisa de Ajuda?", for: .normal)
        needHelpButton.setTitleColor(.darkGray, for: .normal)
        needHelpButton.titleLabel?.font = UIFont(name: "Al Nile", size: 16)
        
        return needHelpButton
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
        self.addSubview(self.emailLabel)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordLabel)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.forgotPasswordButton)
        self.addSubview(self.loginButton)
        self.addSubview(self.needHelpButton)
    }
    
    private func configConstraints() {
        
        let guide = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            
            self.backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.emailLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 70),
            self.emailLabel.trailingAnchor.constraint(greaterThanOrEqualTo: guide.trailingAnchor, constant: -271),
            self.emailLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 30),
            
            
            self.emailTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            self.emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 15),
            self.emailTextField.widthAnchor.constraint(greaterThanOrEqualToConstant: 250),
            
            self.passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            self.passwordLabel.trailingAnchor.constraint(greaterThanOrEqualTo: guide.trailingAnchor, constant: -269),
            self.passwordLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 30),
            
            self.passwordTextField.leadingAnchor.constraint(equalTo: passwordLabel.leadingAnchor),
            self.passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 15),
            self.passwordTextField.widthAnchor.constraint(greaterThanOrEqualToConstant: 250),
            
            self.forgotPasswordButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40),
            
            self.loginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.loginButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 150),
            self.loginButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 250),
            
            self.needHelpButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.needHelpButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -30),
            self.needHelpButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 130)
        ])
        
    }
    
}
