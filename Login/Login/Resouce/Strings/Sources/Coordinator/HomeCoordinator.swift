//
//  HomeCoordinator.swift
//  Login
//
//  Created by COSME D ALVES SILVA on 31/7/2022.
//

import Foundation
import UIKit

class HomeCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = HomeViewController()
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    
    
}
