//
//  RegisterCoordinator.swift
//  Login
//
//  Created by COSME D ALVES SILVA on 18/7/2022.
//

import Foundation
import UIKit

class RegisterCoordinator: Coordinator {
    let navigationController:UINavigationController
    
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = RegisterViewController()
        
        viewController.onTapProfileView = {
            self.gotToRegisterView()
        }
        
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    private func gotToRegisterView() {
        let coordinator = ProfileCoordinator(navigationController: self.navigationController)
        coordinator.start()
    }

}
