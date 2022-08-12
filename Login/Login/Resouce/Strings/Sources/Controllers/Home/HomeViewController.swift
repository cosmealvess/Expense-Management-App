//
//  HomeViewController.swift
//  Login
//
//  Created by COSME D ALVES SILVA on 31/7/2022.
//

import Foundation
import UIKit

class HomeViewController: ViewControllerDefault {
    
    lazy var homeView: HomeView = {
        let homeView = HomeView()
        
        return homeView
    }()
    override func loadView() {
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = LocalizableStrings.addressTitle.localize()
    }
}
