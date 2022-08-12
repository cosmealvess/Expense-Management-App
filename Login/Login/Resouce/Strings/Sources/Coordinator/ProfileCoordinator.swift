//
//  ProfileCoordinator.swift
//  Login
//
//  Created by COSME D ALVES SILVA on 27/7/2022.
//

import Foundation
import UIKit

class ProfileCoordinator: Coordinator{
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let viewControlller = ProfileViewController()
        
        viewControlller.onNextTAP = {
            self.gotToNextView()
        }
        self.navigationController.pushViewController(viewControlller, animated: true)
    }
    
    func gotToNextView() {
        let coordinator = AddressCoordinator(navigationController: self.navigationController)
        coordinator.start()
    }
}
