//
//  LabelTextDefault.swift
//  Login
//
//  Created by COSME D ALVES SILVA on 16/7/2022.
//

import Foundation
import UIKit

class LabelTextDefault: UIView {
    //MARK: - Properties
 
    lazy private var label = LabelDefault(title: String.empty)
    lazy var textField = TextFieldDefault(placeholder: String.empty)

    
    init(placeholder: String, font: UIFont, returnKeyType: UIReturnKeyType = .default) {
        super.init(frame: .zero)
        
        self.textField.placeholder = placeholder
        self.textField.font = font
        self.textField.returnKeyType = returnKeyType
        
        setupVisualElements()
    }
    
    
    init(labelText: String, placeholder: String, isSecureTextEntry: Bool = false) {
        super.init(frame: .zero)
        
        self.label.text = labelText
        self.textField.placeholder = placeholder
        self.textField.isSecureTextEntry = isSecureTextEntry
        setupVisualElements()
    }
    
    init(labelText: String, placeholder: String, isSecureTextEntry: Bool = false, returnKeyType: UIReturnKeyType = .default) {
        super.init(frame: .zero)
        
        self.label.text = labelText
        self.textField.placeholder = placeholder
        self.textField.isSecureTextEntry = isSecureTextEntry
        self.textField.returnKeyType = returnKeyType
        
        setupVisualElements()
    }
    
    init(labelText: String, placeholder: String, font: UIFont, keyboardType: UIKeyboardType, returnKeyType: UIReturnKeyType) {
        super.init(frame: .zero)
        
        self.label.text = labelText
        self.textField.placeholder = placeholder
        self.textField.font = font
        self.textField.keyboardType = keyboardType
        self.textField.returnKeyType = returnKeyType
        setupVisualElements()
    }
    
    init(labelText: String) {
        super.init(frame: .zero)
        self.label.text = labelText
        setupVisualElements()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupVisualElements() {
        let kTop: CGFloat = 8
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        self.addSubview(textField)
        NSLayoutConstraint.activate([
            
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: kTop),
            textField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            textField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            
            self.bottomAnchor.constraint(equalTo: textField.bottomAnchor)
        ])
    }
    
}
