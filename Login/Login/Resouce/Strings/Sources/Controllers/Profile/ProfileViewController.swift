//
//  ProfileViewController.swift
//  Login
//
//  Created by COSME D ALVES SILVA on 27/7/2022.
//

import Foundation
import UIKit

class ProfileViewController: ViewControllerDefault {
    //MARK: - Closures
    var onNextTAP:(() -> Void)?
    
    lazy var profileView: ProfileView = {
        let profileView = ProfileView()
        profileView.onNextTAP = {[weak self] in
            guard let self = self else {return}
            
            self.onNextTAP?()
        }
    
        return profileView
    }()
    
    override func loadView() {
        self.view = profileView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = LocalizableStrings.profileTitle.localize()
    }
}
