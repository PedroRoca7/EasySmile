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
        backgroundImage.image = UIImage(named: "backgroundImage")
        backgroundImage.contentMode = .scaleAspectFill
        
        return backgroundImage
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [fullNameLabel, fullNameTextField, emailLabel,
                                                      emailTextField, cpfLabel, cpfTextField,
                                                      phoneLabel, phoneTextField, passwordLabel,
                                                      passwordTextField])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 20
        
        return stackView
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
        fullNameTextField.borderStyle = .roundedRect
        
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
        emailTextField.borderStyle = .roundedRect
        emailTextField.keyboardType = .emailAddress
        
        return emailTextField
    }()
    
    lazy var cpfLabel: UILabel = {
        let cpfLabel = UILabel()
        cpfLabel.translatesAutoresizingMaskIntoConstraints = false
        cpfLabel.text = "CPF:"
        
        return cpfLabel
    }()
    
    lazy var cpfTextField: UITextField = {
        let cpfTextField = UITextField()
        cpfTextField.translatesAutoresizingMaskIntoConstraints = false
        cpfTextField.borderStyle = .roundedRect
        cpfTextField.keyboardType = .numberPad
        
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
        phoneTextField.borderStyle = .roundedRect
        phoneTextField.keyboardType = .phonePad
        
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
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        
        return passwordTextField
    }()
    
    lazy var registerButton: UIButton = {
        let registerButton = UIButton()
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.setTitle("Cadastrar", for: .normal)
        registerButton.isEnabled = false
        registerButton.titleLabel?.font = UIFont(name: "Arial Rounded MT Bold", size: 22)
        registerButton.backgroundColor = .darkGray
        registerButton.layer.cornerRadius = 20
        
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
        self.addSubview(self.stackView)
        self.addSubview(self.registerButton)
    }
    
    private func configContraints() {
        
        let guide = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
        
            self.backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.stackView.topAnchor.constraint(equalTo: guide.topAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.stackView.bottomAnchor.constraint(equalTo: registerButton.topAnchor, constant: -30),
            
            self.fullNameTextField.widthAnchor.constraint(equalToConstant: 350),
            
            self.emailTextField.widthAnchor.constraint(equalToConstant: 350),
            
            self.cpfTextField.widthAnchor.constraint(equalToConstant: 350),
            
            self.phoneTextField.widthAnchor.constraint(equalToConstant: 350),
            
            self.passwordTextField.widthAnchor.constraint(equalToConstant: 350),
            
            self.registerButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.registerButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
}
