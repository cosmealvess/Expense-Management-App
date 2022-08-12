//
//  LabelDefault.swift
//  Login
//
//  Created by COSME D ALVES SILVA on 16/7/2022.
//

import Foundation
import UIKit

class LabelDefault: UILabel {

    init(title: String, font: UIFont) {
        super.init(frame: .zero)
        
        self.text = title
        self.font = font
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    init(title: String) {
        super.init(frame: .zero)
        initDefault()
        
        self.text = title
    }
    
    init(title: String, numberOfLines: Int, NSLineBreakMode: NSLineBreakMode) {
        super.init(frame: .zero)
        initDefault()
        
        self.text = title
        self.numberOfLines = numberOfLines
        self.lineBreakMode = lineBreakMode
    }

    private func initDefault(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = UIFont.systemFont(ofSize: ConstantsComponents.LabelFontSize, weight: .regular)
        self.textColor = .labelTextColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

