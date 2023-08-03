//
//  RegisterDentistViewController.swift
//  EasySmile
//
//  Created by Pedro Henrique on 18/07/23.
//

import UIKit

class ScreenRegisterDentistViewController: UIViewController {
    
    private var ufs: [String] = []
    private var cep: Cep?
    private var textFields: [UITextField] = []
  
    private lazy var viewModel: RegisterDentistViewModel = {
        let viewModel = RegisterDentistViewModel()
        
        return viewModel
    }()
    
    private lazy var viewScreen: RegisterDentistView = {
        let viewScreen = RegisterDentistView()
        
        return viewScreen
    }()
    
    override func loadView() {
        self.view = viewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationController()
        let viewModel = viewModel
        ufs = viewModel.ufs
        hiddenPickerView()
        configDelegatesDataSource()
        textFields = [viewScreen.fullNameTextField,
                      viewScreen.emailTextField,
                      viewScreen.cpfTextField,
                      viewScreen.phoneTextField,
                      viewScreen.passwordTextField,
                      viewScreen.numberRegistrationTextField]
        
        addObservadoresTextField(textFields: textFields)
        hideKeyBoardWhenTapped()
        viewScreen.registerButton.addTarget(self, action: #selector(registerDentist), for: .touchUpInside)
        viewScreen.ufButton.addTarget(self, action: #selector(ufPressedButton), for: .touchUpInside)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        removeObservadoresTextField(textFields: textFields)
    }
    
    private func configNavigationController() {
        title = "Cadastro de Odontologista"
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.prefersLargeTitles = false
        let textAttributed = [NSAttributedString.Key.foregroundColor: UIColor.magenta]
        navigationController?.navigationBar.titleTextAttributes = textAttributed
    }
    
    private func addObservadoresTextField(textFields: [UITextField]) {
        for textField in textFields {
            textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        }
    }
    
    private func removeObservadoresTextField(textFields: [UITextField]) {
        for textField in textFields {
            textField.removeTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        }
    }
    
    @objc func textFieldDidChange() {
        checkTextFieldIsEmpty()
    }
    
    private func checkTextFieldIsEmpty() {
        
        var allFieldsFilled = true
        
        for textField in textFields {
            if let text = textField.text, text.isEmpty {
                allFieldsFilled = false
                break
            }
        }
        
        if allFieldsFilled {
            viewScreen.registerButton.isEnabled = true
            viewScreen.registerButton.backgroundColor = .magenta
        } else {
            viewScreen.registerButton.isEnabled = false
            viewScreen.registerButton.backgroundColor = .darkGray
        }
    }
    
    
    private func configDelegatesDataSource() {
        viewScreen.ufpickerView.delegate = self
        viewScreen.ufpickerView.dataSource = self
        viewScreen.cepTextField.delegate = self
    }
    
    private func hiddenPickerView() {
        viewScreen.ufpickerView.isHidden = true
    }
    
    @objc private func ufPressedButton() {
        viewScreen.ufpickerView.isHidden = !(viewScreen.ufpickerView.isHidden)
    }
    
    @objc private func registerDentist() {
        
        guard let nome = viewScreen.fullNameTextField.text,
              let email = viewScreen.emailTextField.text,
              let cpf = viewScreen.cpfTextField.text,
              let telefone = viewScreen.phoneTextField.text,
              let numeroInscricaoConselho = viewScreen.numberRegistrationTextField.text,
              let ruaConsultorio = viewScreen.streetOfficeTextField.text,
              let uf = viewScreen.ufButton.title(for: .normal),
              let senha = viewScreen.passwordTextField.text else { return }
        
        let dentist = Dentist(nome: nome, email: email, cpf: cpf, telefone: telefone, numeroDaInscricao: numeroInscricaoConselho, uf: uf, ruaDoConsultorio: ruaConsultorio, senha: senha)
        
        viewModel.registerDentistDb(dentist: dentist, onComplete: { result in
            if result {
                Alert.showBasicAlert(title: "Sucesso", message: "Cadastro feito com sucesso.", viewController: self)
            } else {
                Alert.showActionSheet(title: "Erro", message: "Erro ao fazer o cadastro.", viewController: self)
            }
        })
    }
}

extension ScreenRegisterDentistViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: - UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ufs.count
    }
    
    // MARK: - UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ufs[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedUf = ufs[row]
        viewScreen.ufButton.setTitle(selectedUf, for: .normal)
        hiddenPickerView()
    }
    
}

extension ScreenRegisterDentistViewController: UITextFieldDelegate {
    
    // MARK: - UITextFieldDelegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let maxLenght = 8
        
        if textField == viewScreen.cepTextField {
            let newCep = (textField.text! as NSString).replacingCharacters(in: range, with: string)
            
            if newCep.count > maxLenght {
                return false
            }
            
            if newCep.count == 8 {
                
                viewModel.buscarCep(cep: newCep, completion: { dataCep in
                    if dataCep != nil {
                        DispatchQueue.main.async {
                            self.viewScreen.streetOfficeTextField.text = dataCep?.logradouro
                            self.viewScreen.ufButton.setTitle(dataCep?.uf, for: .normal)
                            self.viewScreen.ufButton.isEnabled = false
                            self.viewScreen.streetOfficeTextField.isEnabled = false
                        }
                    }
                })
            } else {
                self.viewScreen.ufButton.isEnabled = true
                self.viewScreen.streetOfficeTextField.isEnabled = true
                self.viewScreen.ufButton.setTitle("", for: .normal)
                self.viewScreen.streetOfficeTextField.text = ""
            }
        }
        return true
    }
}
