//
//  AppDelegate.swift
//  EasySmile
//
//  Created by Pedro Henrique on 14/07/23.
//

import UIKit
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Inicializar a janela do aplicativo
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // Criar a instância do seu MyViewController
        let myViewController = InitialScreenViewController()
        
        // Criar a instância do navigationController com o MyViewController como o controlador raiz
        let navigationController = UINavigationController(rootViewController: myViewController)
        
        // Definir o navigationController como a raiz da janela
        window?.rootViewController = navigationController
        
        // Tornar a janela visível
        window?.makeKeyAndVisible()
        
        FirebaseApp.configure()
       
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

