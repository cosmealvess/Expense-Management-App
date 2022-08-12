//
//  LoginCoordinator.swift
//  Login
//
//  Created by COSME D ALVES SILVA on 14/7/2022.
//

import Foundation
import UIKit

class LoginCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let viewController = LoginViewController()
        
        viewController.onRegisterTap = {
            self.getToRegisterView()
        }
        
        viewController.onTapOpen = { email, passwd in 
            self.getToRegisterView()
        }
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    private func getToRegisterView() {
        let coordinator = RegisterCoordinator(navigationController: self.navigationController)
        coordinator.start()
    }
}
