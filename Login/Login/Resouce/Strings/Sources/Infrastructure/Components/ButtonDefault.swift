//
//  ButtonDefault.swift
//  Login
//
//  Created by COSME D ALVES SILVA on 16/7/2022.
//

import Foundation
import UIKit


class ButtonDefault: UIButton {
    
    init(image: UIImage) {
        super.init(frame: .zero)
        self.setImage(image, for: .normal)
        
        initDefault()
    }
    
    init(title: String) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        
        initDefault()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initDefault() {
        
        self.backgroundColor = .buttonBackground
        self.setTitleColor(UIColor.buttonTextColor, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = ConstantsComponents.ButtonCornerRadius
    }

}
