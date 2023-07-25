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
    
    var ufs: [String] = []
    var viewModel: RegisterLoginViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ufs = loadUfs()
        hiddenPickerView()
        pickerViewDelegateDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        addObservadoresTextField()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        removeObservadoresTextField()
    }
    
    private func pickerViewDelegateDataSource() {
        ufPickerView.delegate = self
        ufPickerView.dataSource = self
    }
    
    private func hiddenPickerView() {
        ufPickerView.isHidden = true
    }
    
    private func addObservadoresTextField() {
        nomeCompletoDentistTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        cpfTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        telefoneTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        senhaTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        numeroDaInscricaoConselhoTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        ruaDoConsultorioTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    private func removeObservadoresTextField() {
        nomeCompletoDentistTextField.removeTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        emailTextField.removeTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        cpfTextField.removeTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        telefoneTextField.removeTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        senhaTextField.removeTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        numeroDaInscricaoConselhoTextField.removeTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        ruaDoConsultorioTextField.removeTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    private func loadUfs() -> [String] {
        return ["AC", "AL", "AP", "AM", "BA", "CE", "DF", "ES", "GO", "MA", "MT", "MS", "MG", "PA", "PB", "PR", "PE", "PI", "RJ", "RN", "RS", "RO", "RR", "SC", "SP", "SE", "TO"]
    }
    
    @objc func textFieldDidChange() {
        
        let textFields: [UITextField] = [nomeCompletoDentistTextField, emailTextField, cpfTextField, telefoneTextField, senhaTextField, numeroDaInscricaoConselhoTextField, ruaDoConsultorioTextField]
        
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
    
    @IBAction func ufButtonPressed(_ sender: Any) {
        ufPickerView.isHidden = !ufPickerView.isHidden
    }
    
    
    @IBAction func cadastrarDentista(_ sender: Any) {
            
        viewModel = RegisterLoginViewModel()
        
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
