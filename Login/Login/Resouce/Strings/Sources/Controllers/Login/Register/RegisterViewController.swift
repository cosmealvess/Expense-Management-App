//
//  RegisterViewController.swift
//  Login
//
//  Created by COSME D ALVES SILVA on 18/7/2022.
//

import Foundation
import UIKit


class RegisterViewController: ViewControllerDefault {
    //MARK: - Closures
    var onTapProfileView:(() -> Void)?
    //MARK: - ElementsVisual
    lazy var registerView: RegisterView = {
        let view = RegisterView()
        
        view.onTapProfileView = {[weak self] in
            guard let self = self else {return}
            self.onTapProfileView?()
        }
        return view
    }()

    override func loadView() {
        super.loadView()
        self.view = registerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = LocalizableStrings.RegisterTitle.localize()
    }

}
