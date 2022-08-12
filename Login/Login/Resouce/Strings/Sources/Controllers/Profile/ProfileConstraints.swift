//
//  ProfileConstraints.swift
//  Login
//
//  Created by COSME D ALVES SILVA on 27/7/2022.
//

import Foundation
import UIKit

extension ProfileView {
    
    func setupAgeElements() {
        contentView.addSubview(ageLabel)
        contentView.addSubview(ageTextField)
        
        agePickerView.delegate = self
        agePickerView.dataSource = self
        
        ageTextField.inputView = agePickerView
        ageTextField.inputAccessoryView = agePickerView.toolbar
        let Ktop: CGFloat = 8

        ageLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: ConstantConstraint.topAncor).isActive = true
        ageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ConstantConstraint.leftAncor).isActive = true
        ageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: ConstantConstraint.rightAncor).isActive = true
        
        ageTextField.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: Ktop).isActive = true
        ageTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ConstantConstraint.leftAncor).isActive = true
        ageTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: ConstantConstraint.rightAncor).isActive = true
    }
    
    func setupGenderElements() {
        contentView.addSubview(genderLabel)
        contentView.addSubview(genderTextField)
        
        genderPickerView.delegate = self
        genderPickerView.dataSource = self
        
        genderTextField.inputView = genderPickerView
        genderTextField.inputAccessoryView = genderPickerView.toolbar
        
        let Ktop: CGFloat = 8

        genderLabel.topAnchor.constraint(equalTo: ageTextField.bottomAnchor, constant: ConstantConstraint.topAncor).isActive = true
        genderLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ConstantConstraint.leftAncor).isActive = true
        genderLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: ConstantConstraint.rightAncor).isActive = true
        
        genderTextField.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: Ktop).isActive = true
        genderTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ConstantConstraint.leftAncor).isActive = true
        genderTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: ConstantConstraint.rightAncor).isActive = true
    }
    
    func setupCPFElements() {
        contentView.addSubview(cpfLabel)
        contentView.addSubview(cpfTextField)
        cpfTextField.keyboardType = .numberPad
        cpfTextField.delegate = self
   
        let Ktop: CGFloat = 8

        cpfLabel.topAnchor.constraint(equalTo: genderTextField.bottomAnchor, constant: ConstantConstraint.topAncor).isActive = true
        cpfLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ConstantConstraint.leftAncor).isActive = true
        cpfLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: ConstantConstraint.rightAncor).isActive = true
        
        cpfTextField.topAnchor.constraint(equalTo: cpfLabel.bottomAnchor, constant: Ktop).isActive = true
        cpfTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ConstantConstraint.leftAncor).isActive = true
        cpfTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: ConstantConstraint.rightAncor).isActive = true
    }
    
    func setupPhoneElements() {
        contentView.addSubview(phoneLabel)
        contentView.addSubview(phoneTextField)
        phoneTextField.keyboardType = .numberPad
        
        phoneTextField.delegate = self

   
        let Ktop: CGFloat = 8

        phoneLabel.topAnchor.constraint(equalTo: cpfTextField.bottomAnchor, constant: ConstantConstraint.topAncor).isActive = true
        phoneLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ConstantConstraint.leftAncor).isActive = true
        phoneLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: ConstantConstraint.rightAncor).isActive = true
        
        phoneTextField.topAnchor.constraint(equalTo: phoneLabel .bottomAnchor, constant: Ktop).isActive = true
        phoneTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ConstantConstraint.leftAncor).isActive = true
        phoneTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: ConstantConstraint.rightAncor).isActive = true
    }
    
    func setupButtonsElements() {
        contentView.addSubview(buttonSave)
        contentView.addSubview(buttonNext)
        buttonNext.addTarget(self, action: #selector(buttonNextTap), for: .touchUpInside)
        
      
        buttonSave.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ConstantConstraint.leftAncor).isActive = true
        buttonSave.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: ConstantConstraint.rightAncor).isActive = true
        buttonSave.heightAnchor.constraint(equalToConstant: ConstantConstraint.heightButtons).isActive = true
        buttonSave.bottomAnchor.constraint(equalTo: buttonNext.topAnchor, constant: -20).isActive = true
            
        buttonNext.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ConstantConstraint.leftAncor).isActive = true
        buttonNext.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: ConstantConstraint.rightAncor).isActive = true
        buttonNext.heightAnchor.constraint(equalToConstant: ConstantConstraint.heightButtons).isActive = true
        buttonNext.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -120).isActive = true
    }
}
