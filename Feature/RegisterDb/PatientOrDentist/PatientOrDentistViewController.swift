//
//  PatientOrDentistViewController.swift
//  EasySmile
//
//  Created by Pedro Henrique on 01/08/23.
//

import UIKit
import RxSwift
import RxCocoa

class PatientOrDentistViewController: UIViewController {
    
    var registerPatientButton: (() -> Void)?
    var registerDentistButton: (() -> Void)?
    
    private lazy var viewScreen: PatientOrDentistView = {
        let viewScreen = PatientOrDentistView()
        
        return viewScreen
    }()
    
    private let disposedBag = DisposeBag()
    
    override func loadView() {
        self.view = viewScreen
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigation()
       
        viewScreen.patientButton.rx.tap.bind {
            self.registerPatientButton?()
        }.disposed(by: disposedBag)
        
        viewScreen.dentistButton.rx.tap.bind {
            self.registerDentistButton?()
        }.disposed(by: disposedBag)
    }
    
    private func configNavigation() {
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
