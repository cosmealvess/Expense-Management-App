//
//  AddressConstraints.swift
//  Login
//
//  Created by COSME D ALVES SILVA on 30/7/2022.
//

import Foundation
import UIKit

extension AddressView {
    
    func setupCep() {
        contentView.addSubview(cepLabel)
        contentView.addSubview(cepTextField)
        contentView.addSubview(searchButtonCep)
        cepTextField.keyboardType = .numberPad
        
        cepTextField.delegate = self
        searchButtonCep.layer.cornerRadius = ConstantCornerRadius.cornerRadious
        
        let kTop: CGFloat = 110
        let kTopButton: CGFloat = 30
        let kTopCep: CGFloat = 8
        
        cepLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: ConstantConstraint.topAncor).isActive = true
        cepLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ConstantConstraint.leftAncor).isActive = true
        cepLabel.widthAnchor.constraint(equalToConstant: kTop).isActive = true
        
        searchButtonCep.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: ConstantConstraint.rightAncor).isActive = true
        
        searchButtonCep.widthAnchor.constraint(equalToConstant: kTopButton).isActive = true
        searchButtonCep.heightAnchor.constraint(equalToConstant: kTopButton).isActive = true
        
        searchButtonCep.centerYAnchor.constraint(equalTo: cepTextField.centerYAnchor).isActive = true
        
        cepTextField.topAnchor.constraint(equalTo: cepLabel.bottomAnchor, constant: kTopCep).isActive = true
        cepTextField.leadingAnchor.constraint(equalTo: cepLabel.leadingAnchor).isActive = true
        cepTextField.trailingAnchor.constraint(equalTo: searchButtonCep.leadingAnchor, constant: ConstantConstraint.rightAncor).isActive = true
    }
    
    func setupStreet() {
        contentView.addSubview(streetLabel)
        contentView.addSubview(streetTextField)
        
        
        let kTop: CGFloat = 8
        
        streetLabel.topAnchor.constraint(equalTo: cepTextField.bottomAnchor, constant: ConstantConstraint.topAncor).isActive = true
        streetLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ConstantConstraint.leftAncor).isActive = true
        streetLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: ConstantConstraint.rightAncor).isActive = true
        
        streetTextField.topAnchor.constraint(equalTo: streetLabel.bottomAnchor, constant: kTop).isActive = true
        streetTextField.leadingAnchor.constraint(equalTo: streetLabel.leadingAnchor).isActive = true
        streetTextField.trailingAnchor.constraint(equalTo: streetLabel.trailingAnchor).isActive = true
    }
    
    func setupNumber() {
        contentView.addSubview(numberLabel)
        contentView.addSubview(numberTextField)
        
        let kTop: CGFloat = 8
        
        numberLabel.topAnchor.constraint(equalTo: streetTextField.bottomAnchor, constant: ConstantConstraint.topAncor).isActive = true
        numberLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ConstantConstraint.leftAncor).isActive = true
        numberLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: ConstantConstraint.rightAncor).isActive = true
        
        numberTextField.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: kTop).isActive = true
        numberTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ConstantConstraint.leftAncor).isActive = true
        numberTextField.widthAnchor.constraint(equalToConstant: 100).isActive = true
        //        numberTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: ConstantConstraint.rightAncor).isActive = true
        
    }
    
    func setupneighborhood() {
        contentView.addSubview(neighborhoodLabel)
        contentView.addSubview(neighborhoodTextField)
        
        let kTop: CGFloat = 8
        
        neighborhoodLabel.topAnchor.constraint(equalTo: numberTextField.bottomAnchor, constant: ConstantConstraint.topAncor).isActive = true
        neighborhoodLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ConstantConstraint.leftAncor).isActive = true
        neighborhoodLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: ConstantConstraint.rightAncor).isActive = true
        
        neighborhoodTextField.topAnchor.constraint(equalTo: neighborhoodLabel.bottomAnchor, constant: kTop).isActive = true
        neighborhoodTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ConstantConstraint.leftAncor).isActive = true
        neighborhoodTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: ConstantConstraint.rightAncor).isActive = true
        
        
        
    }
    
    
    func setupCity() {
        contentView.addSubview(cityLabel)
        contentView.addSubview(cityTextField)
        
        let kTop: CGFloat = 8
        
        cityLabel.topAnchor.constraint(equalTo: neighborhoodTextField.bottomAnchor, constant: ConstantConstraint.topAncor).isActive = true
        cityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ConstantConstraint.leftAncor).isActive = true
        cityLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: ConstantConstraint.rightAncor).isActive = true
        
        cityTextField.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: kTop).isActive = true
        cityTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ConstantConstraint.leftAncor).isActive = true
        cityTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: ConstantConstraint.rightAncor).isActive = true
    }
    
    func setupState() {
        contentView.addSubview(stateLabel)
        contentView.addSubview(stateTextField)
        
        let kTop: CGFloat = 8
        
        stateLabel.topAnchor.constraint(equalTo: cityTextField.bottomAnchor, constant: ConstantConstraint.topAncor).isActive = true
        stateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ConstantConstraint.leftAncor).isActive = true
        stateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: ConstantConstraint.rightAncor).isActive = true
        
        stateTextField.topAnchor.constraint(equalTo: stateLabel.bottomAnchor, constant: kTop).isActive = true
        stateTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ConstantConstraint.leftAncor).isActive = true
        stateTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: ConstantConstraint.rightAncor).isActive = true
    }
    
    func setupButtonsElements() {
        contentView.addSubview(buttonSave)
        contentView.addSubview(buttonNext)
        buttonSave.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        let kTop: CGFloat = 30
        let kTopNextButton: CGFloat = 15
        
        buttonSave.topAnchor.constraint(equalTo: stateTextField.bottomAnchor, constant: kTop).isActive = true
        buttonSave.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ConstantConstraint.leftAncor).isActive = true
        buttonSave.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: ConstantConstraint.rightAncor).isActive = true
        
        buttonNext.topAnchor.constraint(equalTo: buttonSave.bottomAnchor, constant: kTopNextButton).isActive = true
        buttonNext.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ConstantConstraint.leftAncor).isActive = true
        buttonNext.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: ConstantConstraint.rightAncor).isActive = true

    }
    
    
}

