//
//  ViewController.swift
//  EasySmile
//
//  Created by Pedro Henrique on 14/07/23.
//

import UIKit
import RxSwift
import RxCocoa

class InitialScreenViewController: UIViewController {
    
    var loginButtonTap: (() -> Void)?
    var registerButtonTap: (() -> Void)?
    
    private lazy var viewScreen: InitialScreenView = {
        let viewScreen = InitialScreenView()
        
        
        return viewScreen
    }()
    
    private let disposedBag = DisposeBag()
    
    override func loadView() {
        self.view = viewScreen
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewScreen.loginButton.rx.tap.bind {
            self.loginButtonTap?()
        }.disposed(by: disposedBag)
        
        viewScreen.registerButton.rx.tap.bind {
            self.registerButtonTap?()
        }.disposed(by: disposedBag)
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}
