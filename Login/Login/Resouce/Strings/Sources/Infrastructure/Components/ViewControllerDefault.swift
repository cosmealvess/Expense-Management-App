//
//  ViewControllerDefault.swift
//  Login
//
//  Created by COSME D ALVES SILVA on 18/7/2022.
//

import Foundation
import UIKit

class ViewControllerDefault: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
                let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboardByTappingOutside))
                self.view.addGestureRecognizer(tap)
       


    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    @objc func hideKeyboardByTappingOutside() {
        self.view.endEditing(true)
    }

}
