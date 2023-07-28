//
//  ViewController.swift
//  EasySmile
//
//  Created by Pedro Henrique on 14/07/23.
//

import UIKit

class InitialScreenViewController: UIViewController {
    
    var screenInitial: InitialScreenView?
    
    override func loadView() {
        self.screenInitial = InitialScreenView()
        self.view = screenInitial
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}
