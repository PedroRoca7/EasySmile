//
//  PatientOrDentistView.swift
//  EasySmile
//
//  Created by Pedro Henrique on 01/08/23.
//

import UIKit

class PatientOrDentistView: UIView {
    
    lazy var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.image = UIImage(named: "backgroundTelaLogin")
        backgroundImage.contentMode = .scaleAspectFit
        
        return backgroundImage
    }()
    
    lazy var patientOrDentistLabel: UILabel = {
        let patientOrDentistLabel = UILabel()
        patientOrDentistLabel.translatesAutoresizingMaskIntoConstraints = false
        patientOrDentistLabel.text = "Você é Paciente ou Odontologista?"
        patientOrDentistLabel.numberOfLines = 0
        patientOrDentistLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 30)
        patientOrDentistLabel.textAlignment = .center
        patientOrDentistLabel.textColor = .magenta
        
        return patientOrDentistLabel
    }()
    
    lazy var patientButton: UIButton = {
        let patientButton = UIButton()
        patientButton.translatesAutoresizingMaskIntoConstraints = false
        patientButton.setTitleColor(.white, for: .normal)
        patientButton.setTitle("Paciente", for: .normal)
        patientButton.titleLabel?.font = UIFont(name: "Arial Rounded MT Bold", size: 22)
        
        return patientButton
    }()
    
    lazy var dentistButton: UIButton = {
        let dentistButton = UIButton()
        dentistButton.translatesAutoresizingMaskIntoConstraints = false
        dentistButton.setTitleColor(.white, for: .normal)
        dentistButton.setTitle("Odontologista", for: .normal)
        dentistButton.titleLabel?.font = UIFont(name: "Arial Rounded MT Bold", size: 22)
        
        return dentistButton
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
        self.addSubview(self.patientOrDentistLabel)
        self.addSubview(self.patientButton)
        self.addSubview(self.dentistButton)
    }
    
    private func configConstraints() {
        
        let guide = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
        
            self.backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            self.backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.patientOrDentistLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 50),
            self.patientOrDentistLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.patientOrDentistLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.patientOrDentistLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            self.patientButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.patientButton.topAnchor.constraint(equalTo: patientOrDentistLabel.bottomAnchor, constant: 60),
            self.patientButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 250),
            
            self.dentistButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.dentistButton.topAnchor.constraint(equalTo: patientButton.bottomAnchor, constant: 60),
            self.dentistButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 250)
        ])
    }
    
}
