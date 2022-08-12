//
//  AddressCoordinator.swift
//  Login
//
//  Created by COSME D ALVES SILVA on 30/7/2022.
//

import Foundation
import UIKit

class AddressCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = AddressViewController()
        
        viewController.OnNextButtonTap = {
            self.goToHomeView()
        }
        
        viewController.onSearchCEPTap = { cep in
            CEPViewModel.getCEP(cep: cep) {(viewModel, error) in
                if let viewModel = viewModel {
                    if viewModel.isCepValid {
                    viewController.setAddressFromSearchCEP(cepViewModel: viewModel)
                    } else {
                        viewController.showMessageCepInvalid()
                    }
                }
            }
        }
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    private func goToHomeView() {
        let coordinator = HomeCoordinator(navigationController: self.navigationController)
        coordinator.start()
    }
    
}
