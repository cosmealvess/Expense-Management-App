//
//  RegisterView.swift
//  Login
//
//  Created by COSME D ALVES SILVA on 18/7/2022.
//

import Foundation
import UIKit

class RegisterView: ViewDefault {
 
    //MARK: - Closures
    var onTapProfileView:(() -> Void)?

    //MARK: - Vars
    var scrollPositionDefault: CGPoint?

    //MARK: - Properties

    lazy var emailField = LabelTextDefault(labelText: LocalizableStrings.email.localize(), placeholder: LocalizableStrings.emailPlaceHolder.localize(), font: UIFont.systemFont(ofSize: Constants.fontSize), keyboardType: .emailAddress, returnKeyType: .next)

    lazy var passwordField = LabelTextDefault(labelText: LocalizableStrings.password.localize(), placeholder: LocalizableStrings.passwordPlaceHolder.localize(), isSecureTextEntry: true, returnKeyType: .next)

    lazy var passwordConfirmField = LabelTextDefault(labelText: LocalizableStrings.password.localize(), placeholder: LocalizableStrings.passwordConfirmPlaceHolder.localize(), isSecureTextEntry: true)

    lazy var buttonRegister = ButtonDefault(title: LocalizableStrings.buttonRegister.localize())
    lazy var buttonOpen = ButtonDefault(title: LocalizableStrings.buttonOpen.localize())

    //MARK: - Implementantios and Constraints
    override func setupVisualElements() {
        super.setupVisualElements()
        setupFieldEmail()
        setupFieldPassword()
        setupFieldConfirmPassword()
        setupbuttonRegister()
        setupbuttonOpen()
    }

    private func setupFieldEmail() {
        contentView.addSubview(emailField)
        emailField.textField.delegate = self
        emailField.textField.autocapitalizationType = .none

        NSLayoutConstraint.activate([

            emailField.topAnchor.constraint(equalTo: contentView.topAnchor, constant:  ConstantConstraint.topAncor),
            emailField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant:  ConstantConstraint.leftAncor),
            emailField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant:  ConstantConstraint.rightAncor),
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

            passwordField.topAnchor.constraint(equalTo: self.emailField.bottomAnchor, constant:  ConstantConstraint.topAncor),
            passwordField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant:  ConstantConstraint.leftAncor),
            passwordField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant:  ConstantConstraint.rightAncor),
        ])
    }

    private func setupFieldConfirmPassword() {
        contentView.addSubview(passwordConfirmField)
        passwordConfirmField.textField.delegate = self

        let rightButton = UIButton(type: .custom)
        rightButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        rightButton.addTarget(self, action: #selector(changePasswordConfirmVisibility(_:)), for: .touchUpInside)

        if let image = UIImage(systemName: "eye.fill") {
            rightButton.setImage(image, for: .normal)
        }

        passwordConfirmField.textField.rightViewMode = .always
        passwordConfirmField.textField.rightView = rightButton

        NSLayoutConstraint.activate([

            passwordConfirmField.topAnchor.constraint(equalTo: self.passwordField.bottomAnchor, constant:  ConstantConstraint.topAncor),
            passwordConfirmField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant:  ConstantConstraint.leftAncor),
            passwordConfirmField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant:  ConstantConstraint.rightAncor),
        ])
    }

    private func setupbuttonRegister() {
        contentView.addSubview(buttonRegister)
        
        buttonRegister.addTarget(self, action: #selector(ButtonRegisterTapped), for: .touchUpInside)

        let kTop: CGFloat = 30

        NSLayoutConstraint.activate([

            buttonRegister.topAnchor.constraint(equalTo: self.passwordConfirmField.bottomAnchor, constant:   kTop),
            buttonRegister.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant:  ConstantConstraint.leftAncor),
            buttonRegister.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant:  ConstantConstraint.rightAncor),
        ])
    }

    private func setupbuttonOpen() {
        contentView.addSubview(buttonOpen)


        NSLayoutConstraint.activate([

            buttonOpen.topAnchor.constraint(equalTo: buttonRegister.bottomAnchor, constant: ConstantConstraint.topAncor),
            buttonOpen.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: ConstantConstraint.leftAncor),
            buttonOpen.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: ConstantConstraint.rightAncor),
        ])
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

    @objc private func changePasswordConfirmVisibility(_ sender: UIButton) {
        passwordConfirmField.textField.isSecureTextEntry.toggle()

        if passwordConfirmField.textField.isSecureTextEntry {
            if let image = UIImage(systemName: "eye.fill") {
                sender.setImage(image, for: .normal)
            } else {
                if let image = UIImage(systemName: "eye.slash.fill") {
                    sender.setImage(image, for: .normal)
                }
            }
        }
    }
    
    @objc private func ButtonRegisterTapped() {
        onTapProfileView?()
    }
}


