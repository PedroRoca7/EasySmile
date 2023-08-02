//
//  RegisterDentistView.swift
//  EasySmile
//
//  Created by Pedro Henrique on 01/08/23.
//

import UIKit

class RegisterDentistView: UIView {

    lazy var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.image = UIImage(named: "backgroundTelaLogin")
        backgroundImage.contentMode = .scaleAspectFill
        
        return backgroundImage
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
       
        return scrollView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        
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
    
    lazy var numberRegistrationLabel: UILabel = {
        let numberRegistrationLabel = UILabel()
        numberRegistrationLabel.translatesAutoresizingMaskIntoConstraints = false
        numberRegistrationLabel.text = "Nº de Inscrição no Conselho:"
        
        return numberRegistrationLabel
    }()
    
    lazy var numberRegistrationTextField: UITextField = {
        let numberRegistrationTextField = UITextField()
        numberRegistrationTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return numberRegistrationTextField
    }()
    
    lazy var ufpickerView: UIPickerView = {
        let ufpickerView = UIPickerView()
        ufpickerView.translatesAutoresizingMaskIntoConstraints = false
        ufpickerView.isHidden = true
        
        return ufpickerView
    }()
    
    lazy var cepLabel: UILabel = {
        let cepLabel = UILabel()
        cepLabel.translatesAutoresizingMaskIntoConstraints = false
        cepLabel.text = "CEP:"
        
        return cepLabel
    }()
    
    lazy var cepTextField: UITextField = {
        let cepTextField = UITextField()
        cepTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return cepTextField
    }()
    
    lazy var ufLabel: UILabel = {
        let ufLabel = UILabel()
        ufLabel.translatesAutoresizingMaskIntoConstraints = false
        ufLabel.text = "UF:"
        
        return ufLabel
    }()
    
    lazy var ufButton: UIButton = {
        let ufButton = UIButton()
        ufButton.translatesAutoresizingMaskIntoConstraints = false
        ufButton.setTitle("Selecione a UF", for: .normal)
        ufButton.backgroundColor = .magenta
        ufButton.titleLabel?.textColor = .white
        ufButton.titleLabel?.textAlignment = .center
        
        return ufButton
    }()
    
    lazy var streetOfficeLabel: UILabel = {
        let streetOfficeLabel = UILabel()
        streetOfficeLabel.translatesAutoresizingMaskIntoConstraints = false
        streetOfficeLabel.text = "Rua do Consultório:"
        
        return streetOfficeLabel
    }()
    
    lazy var streetOfficeTextField: UITextField = {
        let streetOfficeTextField = UITextField()
        streetOfficeTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return streetOfficeTextField
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
        self.addSubview(self.scrollView)
        self.scrollView.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.fullNameLabel)
        self.stackView.addArrangedSubview(self.fullNameTextField)
        self.stackView.addArrangedSubview(self.emailLabel)
        self.stackView.addArrangedSubview(self.emailTextField)
        self.stackView.addArrangedSubview(self.cpfLabel)
        self.stackView.addArrangedSubview(self.cpfTextField)
        self.stackView.addArrangedSubview(self.phoneLabel)
        self.stackView.addArrangedSubview(self.phoneTextField)
        self.stackView.addArrangedSubview(self.ufpickerView)
        self.stackView.addArrangedSubview(self.numberRegistrationLabel)
        self.stackView.addArrangedSubview(self.numberRegistrationTextField)
        self.stackView.addArrangedSubview(self.cepLabel)
        self.stackView.addArrangedSubview(self.cepTextField)
        self.stackView.addArrangedSubview(self.ufLabel)
        self.stackView.addArrangedSubview(self.ufButton)
        self.stackView.addArrangedSubview(self.streetOfficeLabel)
        self.stackView.addArrangedSubview(self.streetOfficeTextField)
        self.stackView.addArrangedSubview(self.passwordLabel)
        self.stackView.addArrangedSubview(self.passwordTextField)
        self.stackView.addArrangedSubview(self.registerButton)
        
    }
    
    private func configContraints() {
        
        let guide = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            self.backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.scrollView.topAnchor.constraint(equalTo: guide.topAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            self.stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            self.stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            self.stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            self.fullNameLabel.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 30),
            self.fullNameLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 30),
            self.fullNameLabel.trailingAnchor.constraint(greaterThanOrEqualTo: stackView.trailingAnchor, constant: -231),
            
            self.fullNameTextField.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 10),
            self.fullNameTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -50),
            self.fullNameTextField.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            
            self.emailLabel.topAnchor.constraint(equalTo: fullNameTextField.bottomAnchor, constant: 20),
            self.emailLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 30),
            self.emailLabel.trailingAnchor.constraint(greaterThanOrEqualTo: stackView.trailingAnchor, constant: -231),
            
            self.emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            self.emailTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -50),
            self.emailTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            
            self.cpfLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            self.cpfLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 30),
            self.cpfLabel.trailingAnchor.constraint(greaterThanOrEqualTo: stackView.trailingAnchor, constant: -231),
            
            self.cpfTextField.topAnchor.constraint(equalTo: cpfLabel.bottomAnchor, constant: 10),
            self.cpfTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -50),
            self.cpfTextField.leadingAnchor.constraint(equalTo: cpfLabel.leadingAnchor),
            
            self.phoneLabel.topAnchor.constraint(equalTo: cpfTextField.bottomAnchor, constant: 20),
            self.phoneLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 30),
            self.phoneLabel.trailingAnchor.constraint(greaterThanOrEqualTo: stackView.trailingAnchor, constant: -231),
            
            self.phoneTextField.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 10),
            self.phoneTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -50),
            self.phoneTextField.leadingAnchor.constraint(equalTo: phoneLabel.leadingAnchor),
            
            self.ufpickerView.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            self.ufpickerView.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            
            self.numberRegistrationLabel.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 20),
            self.numberRegistrationLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 30),
            self.numberRegistrationLabel.trailingAnchor.constraint(greaterThanOrEqualTo: stackView.trailingAnchor, constant: -231),
            
            self.numberRegistrationTextField.topAnchor.constraint(equalTo: numberRegistrationLabel.bottomAnchor, constant: 10),
            self.numberRegistrationTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -50),
            self.numberRegistrationTextField.leadingAnchor.constraint(equalTo: numberRegistrationLabel.leadingAnchor),
            
            self.cepLabel.topAnchor.constraint(equalTo: numberRegistrationTextField.bottomAnchor, constant: 20),
            self.cepLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 30),
            self.cepLabel.trailingAnchor.constraint(greaterThanOrEqualTo: stackView.trailingAnchor, constant: -231),
            
            self.cepTextField.topAnchor.constraint(equalTo: cepLabel.bottomAnchor, constant: 10),
            self.cepTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -50),
            self.cepTextField.leadingAnchor.constraint(equalTo: cepLabel.leadingAnchor),
            
            self.ufLabel.topAnchor.constraint(equalTo: cepTextField.bottomAnchor, constant: 20),
            self.ufLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 30),
            self.ufLabel.trailingAnchor.constraint(greaterThanOrEqualTo: stackView.trailingAnchor, constant: -231),
            
            self.ufButton.topAnchor.constraint(equalTo: ufLabel.bottomAnchor, constant: 10),
            self.ufButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -200),
            self.ufButton.leadingAnchor.constraint(equalTo: ufLabel.leadingAnchor),
            
            self.streetOfficeLabel.topAnchor.constraint(equalTo: ufButton.bottomAnchor, constant: 20),
            self.streetOfficeLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 30),
            self.streetOfficeLabel.trailingAnchor.constraint(greaterThanOrEqualTo: stackView.trailingAnchor, constant: -231),
            
            self.streetOfficeTextField.topAnchor.constraint(equalTo: streetOfficeLabel.bottomAnchor, constant: 10),
            self.streetOfficeTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -50),
            self.streetOfficeTextField.leadingAnchor.constraint(equalTo: streetOfficeLabel.leadingAnchor),
            
            self.passwordLabel.topAnchor.constraint(equalTo: streetOfficeTextField.bottomAnchor, constant: 20),
            self.passwordLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 30),
            self.passwordLabel.trailingAnchor.constraint(greaterThanOrEqualTo: stackView.trailingAnchor, constant: -231),
            
            self.streetOfficeTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
            self.streetOfficeTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -50),
            self.streetOfficeTextField.leadingAnchor.constraint(equalTo: passwordLabel.leadingAnchor),
            
            self.registerButton.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            self.registerButton.topAnchor.constraint(equalTo: streetOfficeTextField.bottomAnchor, constant: 30),
            self.registerButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 250)
            
        ])
    }
}
