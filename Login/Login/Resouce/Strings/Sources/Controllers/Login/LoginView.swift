//
//  LoginView.swift
//  Login
//
//  Created by COSME D ALVES SILVA on 14/7/2022.
//

import Foundation
import UIKit

class LoginView: ViewDefault {
    //MARK: - Closures
    var onRegisterTap: (() -> Void)?
    var onTapOpen:((_ email: String, _ password: String) -> Void)?
    var onPasswordWrong: (() -> Void)?
    
    // MARK: - Vars
    
    //MARK: - Properties
    
    lazy var logoImageView: UIImageView = {
        let imageview = UIImageView(image: UIImage(named: "Logo"))
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.contentMode = .scaleAspectFit
        
        return imageview
    }()
    
    lazy var emailField = LabelTextDefault(labelText: LocalizableStrings.email.localize(), placeholder: LocalizableStrings.emailPlaceHolder.localize(), font: UIFont.systemFont(ofSize: Constants.fontSize), keyboardType: .emailAddress, returnKeyType: .next)
    
    lazy var passwordField = LabelTextDefault(labelText: LocalizableStrings.password.localize(), placeholder: LocalizableStrings.passwordPlaceHolder.localize(), isSecureTextEntry: true)
    
    lazy var warningLabel: UILabel =  {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = LocalizableStrings.empty.localize()
        label.textColor = .red
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    lazy var buttonOpen = ButtonDefault(title: LocalizableStrings.buttonOpen.localize())
    lazy var buttonRegister = ButtonDefault(title: LocalizableStrings.buttonRegister.localize())
    
    
    //MARK: - Implementations and Constraints
    override func setupVisualElements() {
        super.setupVisualElements()
        setupImageView()
        setupFieldEmail()
        setupFieldPassword()
        setupbuttonOpen()
        setupbuttonRegister()
        setupAdviceText()
    }
    private func setupImageView() {
        contentView.addSubview(logoImageView)
        
        let kTop: CGFloat = 12
        
        NSLayoutConstraint.activate([
            
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: kTop),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    private func setupFieldEmail() {
        contentView.addSubview(emailField)
        emailField.textField.delegate = self
        
        NSLayoutConstraint.activate([
            
            emailField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: ConstantConstraint.topAncor),
            emailField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: ConstantConstraint.leftAncor),
            emailField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: ConstantConstraint.rightAncor),
        ])
    }
    
    private func setupFieldPassword() {
        contentView.addSubview(passwordField)
        passwordField.textField.delegate = self
        
        let rightButton = UIButton(type: .custom)
        rightButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        rightButton.addTarget(self, action: #selector(changePasswordVisibility(_:)), for: .touchUpInside)
        
        if let image = UIImage(systemName: "eye.fill") {
            rightButton.setImage(image, for: .normal)
        }
        
        passwordField.textField.rightViewMode = .always
        passwordField.textField.rightView = rightButton
        
        NSLayoutConstraint.activate([
            
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: ConstantConstraint.topAncor),
            passwordField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: ConstantConstraint.leftAncor),
            passwordField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: ConstantConstraint.rightAncor),
        ])
    }
    
    private func setupbuttonOpen() {
        contentView.addSubview(buttonOpen)
        let kTop: CGFloat = 30
        
        buttonOpen.addTarget(self, action: #selector(buttonOpenTap), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            
            buttonOpen.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: kTop),
            buttonOpen.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: ConstantConstraint.leftAncor),
            buttonOpen.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: ConstantConstraint.rightAncor),
        ])
    }
    
    private func setupbuttonRegister() {
        self.addSubview(buttonRegister)
        
                buttonRegister.addTarget(self, action: #selector(buttonRegisterTap), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            
            buttonRegister.topAnchor.constraint(equalTo: buttonOpen.bottomAnchor, constant: ConstantConstraint.topAncor),
            buttonRegister.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: ConstantConstraint.leftAncor),
            buttonRegister.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: ConstantConstraint.rightAncor),
            
        ])
    }
    
    public func setupAdviceText() {
        self.addSubview(warningLabel)
        
        let kTop: CGFloat = 2
        
        warningLabel.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: kTop).isActive = true
        warningLabel.leadingAnchor.constraint(equalTo: buttonRegister.leadingAnchor).isActive = true
        warningLabel.trailingAnchor.constraint(equalTo: buttonRegister.trailingAnchor).isActive = true
    }
    
    //MARK: - Actions
    @objc private func buttonOpenTap() {
        if !RegExp.checkPasswordComplexity(password: self.passwordField.textField.text!, length: 6, patternsToEscape:[], caseSensitivty: true, numericDigits: true, specialCharacter: true) {
            warningLabel.text = LocalizableStrings.warningLabel.localize()
            self.passwordField.textField.layer.borderColor = UIColor.red.cgColor
                onPasswordWrong?()
        } else {
            self.passwordField.textField.layer.borderColor = UIColor.black.cgColor
            
            guard let email = self.emailField.textField.text else {return}
            guard let password = self.passwordField.textField.text else {return}
            onTapOpen?(email, password)
        }
    }
    
    @objc private func changePasswordVisibility(_ sender: UIButton) {
        passwordField.textField.isSecureTextEntry.toggle()
        
        if passwordField.textField.isSecureTextEntry {
            if let image = UIImage(systemName: "eye.fill") {
                sender.setImage(image, for: .normal)
            } else {
                if let image = UIImage(systemName: "eye.slash.fill") {
                    sender.setImage(image, for: .normal)
                }
            }
        }
        
    }
    @objc func buttonRegisterTap() {
        onRegisterTap?()
    }
    
}
