//
//  RegisterDentistViewController.swift
//  EasySmile
//
//  Created by Pedro Henrique on 18/07/23.
//

import UIKit

class RegisterDentistViewController: UIViewController {
    
    @IBOutlet weak var nomeCompletoDentistTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var cpfTextField: UITextField!
    @IBOutlet weak var telefoneTextField: UITextField!
    @IBOutlet weak var numeroDaInscricaoConselhoTextField: UITextField!
    @IBOutlet weak var ruaDoConsultorioTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    @IBOutlet weak var cadastrarButton: UIButton!
    @IBOutlet weak var ufButton: UIButton!
    @IBOutlet weak var ufPickerView: UIPickerView!
    @IBOutlet weak var cepTextField: UITextField!
    
    var ufs: [String] = []
    var viewModel: RegisterLoginViewModel?
    var cep: Cep?
    var textFields: [UITextField] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = RegisterLoginViewModel()
        ufs = loadUfs()
        hiddenPickerView()
        configDelegatesDataSource()
        textFields = [nomeCompletoDentistTextField, emailTextField, cpfTextField, telefoneTextField, senhaTextField, numeroDaInscricaoConselhoTextField, ruaDoConsultorioTextField]
        addObservadoresTextField(textFields: textFields)
        hideKeyBoardWhenTapped()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        removeObservadoresTextField(textFields: textFields)
    }
    
    private func configDelegatesDataSource() {
        ufPickerView.delegate = self
        ufPickerView.dataSource = self
        cepTextField.delegate = self
    }
    
    private func hiddenPickerView() {
        ufPickerView.isHidden = true
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
    
    private func loadUfs() -> [String] {
        return ["AC", "AL", "AP", "AM", "BA", "CE", "DF", "ES", "GO", "MA", "MT", "MS", "MG", "PA", "PB", "PR", "PE", "PI", "RJ", "RN", "RS", "RO", "RR", "SC", "SP", "SE", "TO"]
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
            cadastrarButton.isEnabled = true
            cadastrarButton.backgroundColor = .magenta
        } else {
            cadastrarButton.isEnabled = false
            cadastrarButton.backgroundColor = .darkGray
        }
    }
    
    @IBAction func ufPressedButton(_ sender: Any) {
        ufPickerView.isHidden = !ufPickerView.isHidden
    }
    
    @IBAction func registerDentist(_ sender: Any) {
        
        guard let nome = nomeCompletoDentistTextField.text,
              let email = emailTextField.text,
              let cpf = cpfTextField.text,
              let telefone = telefoneTextField.text,
              let numeroInscricaoConselho = numeroDaInscricaoConselhoTextField.text,
              let ruaConsultorio = ruaDoConsultorioTextField.text,
              let uf = ufButton.title(for: .normal),
              let senha = senhaTextField.text else { return }
        
        let dentist = Dentist(nome: nome, email: email, cpf: cpf, telefone: telefone, numeroDaInscricao: numeroInscricaoConselho, uf: uf, ruaDoConsultorio: ruaConsultorio, senha: senha)
        
        viewModel?.registerDentistDb(dentist: dentist, onComplete: { result in
            if result {
                Alert.showBasicAlert(title: "Sucesso", message: "Cadastro feito com sucesso.", viewController: self)
            } else {
                Alert.showActionSheet(title: "Erro", message: "Erro ao fazer o cadastro.", viewController: self)
            }
        })
    }
    }
    
extension RegisterDentistViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
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
        ufButton.setTitle(selectedUf, for: .normal)
        hiddenPickerView()
    }
    
}

extension RegisterDentistViewController: UITextFieldDelegate {
    
    // MARK: - UITextFieldDelegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == cepTextField {
            let newCep = (textField.text! as NSString).replacingCharacters(in: range, with: string)
            
            if newCep.count == 8 {
                view.endEditing(true)
                viewModel?.buscarCep(cep: newCep, completion: { dataCep in
                    if dataCep != nil {
                        DispatchQueue.main.async {
                            self.ruaDoConsultorioTextField.text = dataCep?.logradouro
                            self.ufButton.setTitle(dataCep?.uf, for: .normal)
                            self.ufButton.isEnabled = false
                            self.ruaDoConsultorioTextField.isEnabled = false
                        }
                    }
                })
            } else {
                self.ufButton.isEnabled = true
                self.ruaDoConsultorioTextField.isEnabled = true
                self.ufButton.setTitle("", for: .normal)
                self.ruaDoConsultorioTextField.text = ""
            }
        }
        return true
    }
}
