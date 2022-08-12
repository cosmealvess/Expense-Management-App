//
//  LoginViewController.swift
//  Login
//
//  Created by COSME D ALVES SILVA on 14/7/2022.
//

import Foundation
import UIKit

class LoginViewController: ViewControllerDefault {
    var onRegisterTap:(() -> Void)?
    var onTapOpen:((_ email: String, _ password: String) -> Void)?
    
    lazy var loginView: LoginView = {
        let view = LoginView()
        
        view.onRegisterTap = {[weak self] in
            guard let self = self else {return}
            self.onRegisterTap?()
        }
        
            view.onPasswordWrong = {
                self.passwordWrong()
        }
        
        view.onTapOpen = {[weak self] email, password in
            guard let self = self else {return}
            self.onTapOpen?(email, password)
        }
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = LocalizableStrings.login.localize()
}
    
    private func passwordWrong() {
        let alert = UIAlertController(title: LocalizableStrings.error.localize(), message: LocalizableStrings.message.localize(), preferredStyle: .alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: LocalizableStrings.ok.localize(), style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
}
