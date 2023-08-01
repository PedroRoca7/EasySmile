//
//  RegisterPatientView.swift
//  EasySmile
//
//  Created by Pedro Henrique on 01/08/23.
//

import UIKit

class RegisterPatientView: UIView {
    
    lazy var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.image = UIImage(named: "backgroundTelaLogin")
        backgroundImage.contentMode = .scaleAspectFit
        
        return backgroundImage
    }()
    
    lazy var fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        fullNameLabel.text = "Nome Completo:"
        
        return fullNameLabel
    }()
    
    lazy var fullNameTextField: UITextField = {
        let fullNameTextField = UITextField()
        fullNameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return fullNameTextField
    }()
    
    lazy var emailLabel: UILabel = {
        let emailLabel = UILabel()
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.text = "Email:"
        
        return emailLabel
    }()
    
    lazy var emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return emailTextField
    }()
    
    lazy var cpfLabel: UILabel = {
        let cpfLabel = UILabel()
        cpfLabel.translatesAutoresizingMaskIntoConstraints = false
        cpfLabel.text = "Email:"
        
        return cpfLabel
    }()
    
    lazy var cpfTextField: UITextField = {
        let cpfTextField = UITextField()
        cpfTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return cpfTextField
    }()
    
    lazy var phoneLabel: UILabel = {
        let phoneLabel = UILabel()
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.text = "Telefone:"
        
        return phoneLabel
    }()
    
    lazy var phoneTextField: UITextField = {
        let phoneTextField = UITextField()
        phoneTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return phoneTextField
    }()
    
    lazy var passwordLabel: UILabel = {
        let passwordLabel = UILabel()
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.text = "Senha:"
        
        return passwordLabel
    }()
    
    lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return passwordTextField
    }()
    
    lazy var registerButton: UIButton = {
        let registerButton = UIButton()
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.setTitle("Cadastrar", for: .normal)
        registerButton.isEnabled = false
        registerButton.titleLabel?.font = UIFont(name: "Arial Rounded MT Bold", size: 22)
        
        return registerButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElementsView()
        configContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElementsView() {
        self.addSubview(self.backgroundImage)
        self.addSubview(self.fullNameLabel)
        self.addSubview(self.fullNameTextField)
        self.addSubview(self.emailLabel)
        self.addSubview(self.emailTextField)
        self.addSubview(self.cpfLabel)
        self.addSubview(self.cpfTextField)
        self.addSubview(self.phoneLabel)
        self.addSubview(self.phoneTextField)
        self.addSubview(self.passwordLabel)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.registerButton)
    }
    
    private func configContraints() {
        
        let guide = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
        
            self.backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.fullNameLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 30),
            self.fullNameLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 30),
            self.fullNameLabel.trailingAnchor.constraint(greaterThanOrEqualTo: guide.trailingAnchor, constant: -313),
            
            self.fullNameTextField.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 10),
            self.fullNameTextField.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -50),
            self.fullNameTextField.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            
            self.emailLabel.topAnchor.constraint(equalTo: fullNameTextField.bottomAnchor, constant: 20),
            self.emailLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 30),
            self.emailLabel.trailingAnchor.constraint(greaterThanOrEqualTo: guide.trailingAnchor, constant: -313),
            
            self.emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            self.emailTextField.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -50),
            self.emailTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            
            self.cpfLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            self.cpfLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 30),
            self.cpfLabel.trailingAnchor.constraint(greaterThanOrEqualTo: guide.trailingAnchor, constant: -313),
            
            self.cpfTextField.topAnchor.constraint(equalTo: cpfLabel.bottomAnchor, constant: 10),
            self.cpfTextField.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -50),
            self.cpfTextField.leadingAnchor.constraint(equalTo: cpfLabel.leadingAnchor),
            
            self.phoneLabel.topAnchor.constraint(equalTo: cpfTextField.bottomAnchor, constant: 20),
            self.phoneLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 30),
            self.phoneLabel.trailingAnchor.constraint(greaterThanOrEqualTo: guide.trailingAnchor, constant: -313),
            
            self.phoneTextField.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 10),
            self.phoneTextField.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -50),
            self.phoneTextField.leadingAnchor.constraint(equalTo: phoneLabel.leadingAnchor),
            
            self.passwordLabel.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 20),
            self.passwordLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 30),
            self.passwordLabel.trailingAnchor.constraint(greaterThanOrEqualTo: guide.trailingAnchor, constant: -313),
            
            self.passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            self.passwordTextField.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -50),
            self.passwordTextField.leadingAnchor.constraint(equalTo: passwordLabel.leadingAnchor),
            
            self.registerButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 100),
            self.registerButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 250)
        ])
    }
    
}
